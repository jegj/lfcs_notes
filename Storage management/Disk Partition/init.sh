# For GDT partitions
sudo apt install gdisk

# block devices and report on their attributes.
sudo blkid /dev/sda*

# presents block device information in a tree format
sudo lsblk

# Show infor about the devices
sudo parted -l

# Add a label to the device
e2label /dev/sdb1 data

#
# Using fdisk
#
fdisk -l <part>
gdisk -l <part>

# 1) Create partition table
# 2) Create partitions

partprobe -s # to show summary
# or
partprobe <part>

sudo mkfs.ext4 -L test /dev/sdb1
sudo mkfs.ext4 -L test2 /dev/sdb2

tune2fs -l /dev/sdb1

sudo mkdir /data
sudo mount /dev/sdb1 /data/

# Add entries to fstab

LABEL=data /data      ext4 defaults 0       2
LABEL=backup /backup  ext4 defaults 0       2
