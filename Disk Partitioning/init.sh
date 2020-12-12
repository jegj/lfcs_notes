# block devices and report on their attributes.
sudo blkid /dev/sda*

# presents block device information in a tree format
sudo lsblk

# Show infor about the devices
sudo parted -l

#
# Using fdisk
#
fdisk -l <part>

# 1) Create partition table
# 2) Create partitions

partprobe -s

sudo mkfs.ext4 /dev/sdb1
sudo mkfs.ext4 /dev/sdb2

sudo mkdir /data
sudo mount /dev/sdb1 /data/
