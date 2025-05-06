#!/bin/bash

# List of variables used in script
NVMEDRIVE2="/dev/nvme1n1"
PARTITION1="${NVMEDRIVE2}p1"
PARTITION2="${NVMEDRIVE2}p2"
PARTITION3="${NVMEDRIVE2}p3"
MOUNT_POINT1="/media/$USER/Documents"
MOUNT_POINT2="/media/$USER/VMstg"
MOUNT_POINT3="/media/$USER/Backupstg"
FSTAB_BACKUP="/etc/fstab.bak.$(date +%F-%H%M%S)"

# Check if disk exists
if [ ! -b "$NVMEDRIVE2" ]; then
    echo "Disk $NVMEDRIVE2 not found. Exiting."
    exit 1
fi

# Confirm data loss on drive
echo "WARNING: This will erase all data on $NVMEDRIVE2"
read -p "Type 'YES' ALL CAPS to continue: " CONFIRM

if [ "$CONFIRM" != "YES" ]; then
  echo "Operation cancelled."
  exit 0
fi

# Create a new GPT partition table
parted -s "$NVMEDRIVE2" mklabel gpt

# Create first partition: 60GB
parted -s "$NVMEDRIVE2" mkpart primary ext4 1MiB 60GiB

# Create second partition: 500GB
parted -s "$NVMEDRIVE2" mkpart primary ext4 60GiB 560GiB

# Create third partition: remaining space
parted -s "$NVMEDRIVE2" mkpart primary ext4 560GiB 100%

# Print partition table
parted "$NVMEDRIVE2" print

echo "Partitioning complete."

# Wait for the system to recognize the new partition
sleep 4

# Format the partition as ext4
echo "Formatting partitions as ext4..."
mkfs.ext4 "$PARTITION1"
mkfs.ext4 "$PARTITION2"
mkfs.ext4 "$PARTITION3"

# Create mount point directory if it doesn't exist
mkdir -p "$MOUNT_POINT1"
mkdir -p "$MOUNT_POINT2"
mkdir -p "$MOUNT_POINT3"

# Mount the partition
mount "$PARTITION1" "$MOUNT_POINT1"
mount "$PARTITION2" "$MOUNT_POINT2"
mount "$PARTITION3" "$MOUNT_POINT3"

# Backup /etc/fstab
echo "Backing up /etc/fstab to $FSTAB_BACKUP..."
cp /etc/fstab "$FSTAB_BACKUP"

# Get UUIDS as variables to store in /etc/fstab
UUID1=$(blkid -s UUID -o value $PARTITION1)
UUID2=$(blkid -s UUID -o value $PARTITION2)
UUID3=$(blkid -s UUID -o value $PARTITION3)

# Add UUIDS to the /etc/fstab file
echo "Adding entries to /etc/fstab..."
{
  echo ""
  echo "# NVMe partitions added on $(date)"
  echo "UUID=$UUID1 $MOUNT_POINT1 ext4 defaults 0 2"
  echo "UUID=$UUID2 $MOUNT_POINT2 ext4 defaults 0 2"
  echo "UUID=$UUID3 $MOUNT_POINT3 ext4 defaults 0 2"
} >> /etc/fstab

# Outputs the last 7 lines of the /etc/fstab file
tail -n 7 /etc/fstab

# Confirm done with drive setup
echo "$PARTITION1 mounted at $MOUNT_POINT1 and configured in /etc/fstab"
echo "$PARTITION2 mounted at $MOUNT_POINT2 and configured in /etc/fstab"
echo "$PARTITION3 mounted at $MOUNT_POINT3 and configured in /etc/fstab"




