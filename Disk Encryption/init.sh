#!/bin/bash
# 1) Umount partition first

sudo cryptsetup luksFormat /dev/sdb5

sudo cryptsetup luksOpen /dev/sdb5 secret-disk

#######Add entry to /etc/crypttab#####
secret-disk /dev/sdb5
###############################

sudo mkfs.ext4 /dev/mapper/secret-disk

sudo mkdir -p /secret

#######Add entry to /etc/fstab#####
/dev/mapper/secret-disk    /secret    ext4    defaults1 2
##################################


sudo mount /secret

# Mount all filesystem in fstab
sudo mount -a