#!/bin/bash

####### Basic Usage

# fdisk/gdisk => Linux Raid

# 1) Install dependecies
apt install mdadm

# 2) Create partition for RAID

lvcreate -L 5G -n r0 myvg
lvcreate -L 5G -n r1 myvg

# 3) Create RAID

mdadm -C /dev/md1 --level=1 --raid-disks=2 /dev/myvg/r0 /dev/myvg/r1

# 4) mkfs
mkfs.ext4 /dev/md1
mkdir /myraid
mount /dev/md1 /myraid
echo "/dev/md1 /myraid ext4 defaults 0 2" >> /etc/fstab

# 5) Add metadata
bash -c "mdadm --detail --scan >> /etc/mdadm.conf"

# 6) Print some info
cat /proc/mdstat

# 7) Add some data
echo "Esto es una prueba." > /myraid/test


# 8) start monitor
systemctl start mdmonitor

####### Testing failure

# 1) Set fail on disk
mdadm -f /dev/md1 /dev/myvg/r0

# 2) Remove from RAID
mdadm /dev/md1 --remove /dev/myvg/r0

# 3) Add disk
lvcreate -L 5G -n r2 myvg
mdadm /dev/md1 --add /dev/myvg/r2

# 5) Increase raid disk instead of spare disk
mdadm --grow --raid-devices=3 /dev/md1

# 6) Decrease raid disk
mdadm /dev/md1 --fail /dev/myvg/r0 --remove /dev/myvg/r0
mdadm --grow /dev/md0 --raid-devices=2

umount partition
resize2fs

####### Delete RAID

# 1) Umount and stop service
umount /dev/md1
systemctl stop mdmonitor

# 2) Stop
mdadm --stop /dev/md1
# or
mdadm -S /dev/md1

# 3) Clean partition
mdadm --zero-superblock /dev/myvg/r0 /dev/myvg/r1 /dev/myvg/r2