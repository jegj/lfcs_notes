#!/bin/bash

# Install common packages
apt install nfs-kernel-server

# Add entry /etc/exports
/data *(rw,no_root_squash)

# Add
systemctl start nfs-server

# SHow mount
showmount -e localhost
showmount -e 192.168.86.56

# MOunt in the client
# Add ip to /etc/hosts
mount master:/data /mnt

# Add entry to fstab
master:/data   /data  nfs   _netdev 0 0
