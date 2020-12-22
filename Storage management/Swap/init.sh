#!/bin/bash

# Show info about the swaps
cat /proc/swaps

# Create new partition based on a file
dd if=/dev/zero of=swpfile bs=1M count=1024

# mkswap
sudo mkswap swpfile
sudo mkswap /dev/sdb4

# swapon
# turn on swap
sudo swapon swpfile
sudo swapon /dev/sdb4

# swapoff
# turn off swap
sudo swapoff swpfile
sudo swapoff /dev/sdb4

# Add entries to fstab >>
/dev/sda1 none swap sw 0 0
/home/vagrant/swpfile none swap sw 0 0

# Run all devices marked as swap in fstab
swapon -a