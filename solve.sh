#!/bin/sh

filename='the_long_way.img'
# Setup a loop device
loopdev=$(udisksctl loop-setup -f $filename | grep -oh '/dev/loop[0-9]')
echo "Loop device: $loopdev"
# Mount the loop device
mountpoint=$(udisksctl mount -b $loopdev | grep -oP 'at \K\/.*(?=\.)')
echo "Mount point: $mountpoint"
# Launch the challenge solve script
ruby solve.rb $mountpoint
ls $mountpoint
# Unmount the loop device
udisksctl unmount -b $loopdev
# Delete the loop device
udisksctl loop-delete -b $loopdev