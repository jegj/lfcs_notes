#!/bin/bash

#########Encrypted

sudo apt install -y cryptsetup
# 1) Create encrypted partition first

sudo cryptsetup luksFormat /dev/sdb3 [key-file]

# To prompt password on boot:
sudo cryptsetup luksOpen /dev/sdb3 secret-disk
# or
sudo cryptsetup open --type luks /dev/sdb3 secret-disk

# 2) Format partition and add entry to fstab

sudo mkfs.ext4 /dev/mapper/secret-disk

#######Add entry to /etc/fstab#####
/dev/mapper/secret-disk    /secret    ext4    defaults 0 2
##################################
sudo mkdir -p /secret

# 3) Add key to safe location
echo "madrid" >> /root/key
chmod 0400 /root/key
sudo cryptsetup luksAddKey /dev/mapper/secret-disk /root/key

# 4) Add key to /etc/crypttab
secret-disk  /dev/sdb3 /root/key

# 5) mount partition

sudo mount /secret
# Or Mount all filesystem in fstab:
# sudo mount -a

######### Close Devices

sudo umount /secret
sudo cryptsetup --verbose luksClose secret-disk <SECRET>
# or
sudo cryptsetup close /dev/sdb3

# Resize encryption
cryptsetup resize /dev/mapper/secret-disk