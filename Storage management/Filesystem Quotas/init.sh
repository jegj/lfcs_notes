#! /bin/bash

# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/storage_administration_guide/ch-disk-quotas

## 1) Install
sudo apt install -y quota

## 2) Add usrquota in the /etc/fstab and previous actions
LABEL=data     /data         ext4  defaults,usrquota 0 2
sudo chown vagrant.vagrant /data

## 3) Remount partition
sudo mount -o remount /data

## 4)  Create quota files
sudo quotacheck -cug /data

# or for all:
sudo quotacheck -avug # a= all filesystem, v=verbose, u=user, g=group

## 6) Assigning Quotas per User
sudo edquota -u vagrant

# Disk quotas for user vagrant (uid 1000):
#   Filesystem                   blocks       soft       hard     inodes     soft     hard
#   /dev/sdb1                      2052       <2048>     <3072>          4        0        0
#  soft use the grace period

# or per group:
sudo edquota -g vagrant

## 7) Check quota
quota vagrant

## 5) Setting the Grace Period for Soft Limits
edquota -t

##-------------------------------------------###

## Disabling/Enabling for all filesystem
sudo quotaoff -vaug  # u= user, g =group , v=verbose, a=all filesystems
sudo quotaon  -vaug

## Disabling for an specific filesystem
sudo quotaff -vaug  /data # u= user, g =group , v=verbose, a=all filesystems
sudo quotaon -vaug /data

##  Report for quotas
repquota /data

## Create big files
dd if=/dev/zero of=bigfile1 bs=1024 count=200
dd if=/dev/zero of=bigfile2 bs=1024 count=400
dd if=/dev/zero of=bigfile3 bs=1024 count=600