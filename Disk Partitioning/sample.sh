#!/bin/bash

sudo dd if=/dev/zero of=/imagefile bs=1M count=250 # 250 MB image file
# sudo dd if=/dev/urandom of=/imagefile bs=1M count=250

#### extra step #########
#losetup -f
#sudo losetup /dev/loop<x>/ imagefile
#losetup -l

sudo mkfs -t ext4 -b 1024 -v imagefile # blocksize 1024
sudo mkfs -t ext4 -b 2048 -v imagefile # blocksize 2048
sudo mkfs -t ext4 -b 4096 -v imagefile # blocksize 4096

sudo mkdir /mnt/tempdir
sudo mount -o loop /imagefile /mnt/tempdir$
mount | grep tempdir

sudo umount /mnt/tempdir
sudo mount -o ro,loop /imagefile /mnt/tempdirq

sudo umount /mnt/tempdir -l

sudo mount -o loop,noexec /imagefile /mnt/tempdirq