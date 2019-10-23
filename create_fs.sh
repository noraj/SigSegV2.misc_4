#!/bin/sh

# Install exFAT utils to be able to format
#sudo pacman -S exfat-utils
# Why exFAT? Only FAT-like FS can be mounted with write permission without
# root privilege.

# Create a new file
filename='the_long_way.img'
fallocate -l 10M $filename
# Format it to ext4
mkfs.exfat $filename
# Setup a loop device
loopdev=$(udisksctl loop-setup -f $filename | grep -oh '/dev/loop[0-9]')
echo "Loop device: $loopdev"
# Mount the loop device
mountpoint=$(udisksctl mount -b $loopdev | grep -oP 'at \K\/.*(?=\.)')
echo "Mount point: $mountpoint"
# Launch the challenge creation script
ruby create_folder.rb $mountpoint
ls $mountpoint
# Unmount the loop device
udisksctl unmount -b $loopdev
# Delete the loop device
udisksctl loop-delete -b $loopdev