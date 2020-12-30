#!/bin/bash

sudo apt-get install lvm2

# 1) Create tests partitions and then run:
sudo partprobe -s

# 2) Create physical volume
sudo pvcreate /dev/sdb5
sudo pvcreate /dev/sdc1

sudo pvdisplay

# 3) Create volume group
sudo vgcreate myvg /dev/sdb5 /dev/sdc1
sudo vgdisplay

# 4) Create logical volume
sudo lvcreate -L 5G -n mylvm myvg
sudo lvdisplay

# Mirrored logical volume: lvcreate -L 100M -m1 -n lv_mirror myvg
# Striped logical volume : lvcreate -L 500M -i2 -I64 -n lv_stripe myvg

# 5) Format and mount
sudo mkfs.ext4 /dev/myvg/mylvm
sudo mkdir /mylvm
sudo mount /dev/myvg/mylvm /mylvm
sudo lvdisplay

# 6) Resize lv and filesystems
sudo lvresize -r -L +5G /dev/myvg/mylvm
# or
sudo lvresize -r -L 10G /dev/myvg/mylvm

# Old method:
sudo lvextend -L 350M /dev/myvg/mylvm
sudo resize2fs /dev/myvg/mylvm
df -h

# 7 ) Extend volume group
sudo pvcreate /dev/sdc2
sudo vgextend myvg /dev/sdc2
sudo vgdisplay