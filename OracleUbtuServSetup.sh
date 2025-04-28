#!/bin/bash

# Variables
DISK="/dev/sdb"
PARTITION="${DISK}1"
MOUNT_POINT="/blockvolume1"
FSTAB_BACKUP="/etc/fstab.bak.$(date +%F-%H%M%S)"

# Check if disk exists
if [ ! -b "$DISK" ]; then
    echo "Disk $DISK not found. Exiting."
    exit 1
fi

# Unmount if already mounted
umount "$PARTITION" 2>/dev/null

# Create a new partition table and one partition
echo "Creating partition on $DISK..."
(
echo o      # Create a new DOS partition table
echo n      # New partition
echo p      # Primary
echo 1      # Partition number 1
echo        # Default - start at beginning of disk
echo        # Default - end at end of disk
echo w      # Write changes
) | fdisk "$DISK"

# Wait for the system to recognize the new partition
sleep 4

# Format the partition as ext4
echo "Formatting $PARTITION as ext4..."
mkfs.ext4 "$PARTITION"

# Create mount point directory if it doesn't exist
mkdir -p "$MOUNT_POINT"

# Mount the partition
mount "$PARTITION" "$MOUNT_POINT"

# Get UUID for fstab entry
UUID=$(blkid -s UUID -o value "$PARTITION")

# Backup /etc/fstab
echo "Backing up /etc/fstab to $FSTAB_BACKUP..."
cp /etc/fstab "$FSTAB_BACKUP"

# Add to /etc/fstab if not already present
if ! grep -q "$UUID" /etc/fstab; then
    echo "UUID=$UUID $MOUNT_POINT ext4 defaults 0 2" >> /etc/fstab
    echo "Added $PARTITION to /etc/fstab"
fi

# Done with disk setup
echo "$PARTITION mounted at $MOUNT_POINT and configured in /etc/fstab"

# Install WireGuard via PiVPN in unattended mode
echo "Installing WireGuard via PiVPN unattended installer..."
curl -L https://install.pivpn.io | bash -s -- --unattended \
    --user ubuntu \
    --protocol wireguard \
    --port 51820 \
    --dns quad9 \
    --ip public \
    --auto-reboot \
    --unattended-upgrades


