#!/bin/bash

# PORT => 139,445

# Install samba
apt install samba

# Add data share /etc/samba/smb.conf
[backups]
   comment = backups
   path = /backups
   browseable = yes
   writeable  = yes
   valid users = linda

# Restart Service
systemctl restart smbd

# Create smb user
smbpasswd -a linda # test

#### On client

# Install dependecies
apt install samba-client cifs-utils

# List smb shares
smbclient -L master

# Mount
mount -o username=linda,password=test //master/backups /mnt

# Add entry fstab
//master/backups          /backups                  cifs       _netdev,username=linda,password=test 0 0
