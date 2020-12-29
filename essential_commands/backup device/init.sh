#!/bin/bash

# Backup a device
## Device must be unmounted

dd if=/dev/sdb1 of=sdb1.img

# Restore device
dd if=sdb1.img of=/dev/sdb1

# Create 250/600 MB image file fills with zeros
dd if=/dev/zero of=/imagefile bs=1M count=250
dd if=/dev/zero of=bigfile3 bs=1M count=600
dd if=/dev/random of=bigfile3 bs=1M count=600

# compress/uncompress your backup.
dd if=/dev/sdb1 | gzip -c > sdb1.img.gz
gunzip -c sdb1.img.gz | dd of=/dev/sdb1