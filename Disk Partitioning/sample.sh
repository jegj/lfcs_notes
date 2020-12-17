#!/bin/bash

sudo dd if=/dev/zero of=/imagefile bs=1M count=250

sudo mkfs -t ext4 -b 2048 -v imagefile
sudo mkfs -t ext4 -b 4096 -v imagefile

sudo mkdir /mnt/tempdir
sudo mount -o loop /imagefile /mnt/tempdir$
mount | grep tempdir

sudo umount /mnt/tempdir
sudo mount -o ro,loop /imagefile /mnt/tempdirq

sudo umount /mnt/tempdir -l

sudo mount -o loop,noexec /imagefile /mnt/tempdirq