#!/bin/bash

# Pool name
POOL_NAME="mypool"

# Devices for the mirror
DISK1="/dev/sda"
DISK2="/dev/sdb"

# Check if zfs is installed
if ! command -v zpool &> /dev/null; then
    echo "ZFS utilities not found. Install them with: sudo apt install zfsutils-linux"
    exit 1
fi

# Confirm devices will be erased
echo "WARNING: This will erase all data on $DISK1 and $DISK2."
read -p "Type 'YES' ALL CAPS to continue: " CONFIRM

if [ "$CONFIRM" != "YES" ]; then
    echo "Operation cancelled."
    exit 0
fi

# Create the mirrored pool
echo "Creating mirrored ZFS pool '$POOL_NAME' on $DISK1 and $DISK2..."
sudo zpool create -f "$POOL_NAME" mirror "$DISK1" "$DISK2"

# ZFS auto mounts at /$POOL_NAME)

# Check pool status
echo ""
echo "ZFS pool status:"
sudo zpool status "$POOL_NAME"

# List ZFS filesystems
echo ""
echo "ZFS filesystems:"
sudo zfs list

echo ""
echo "ZFS mirror pool '$POOL_NAME' created successfully."
