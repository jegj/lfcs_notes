#!/bin/bash

# SHow ip config
ip a

# Add a new ip
ip address add dev eth0 1.2.3.4/8

# Dele IP
ip address del dev eth0 1.2.3.4/8

# Add static route
ip route add 172.16.5.0/24 via 10.0.0.101 dev eth0

# Hostname details
hostnamectl status

# Set hostname
hostnamectl set-hostname vagrant.test.com
  # /etc/nsswitch.conf to change the order resolution

# Show the default gateway
ip route show

# Delete default route
ip route del default via 10.0.2.2

# Add default route
ip route add default via 10.0.2.2

# Renew ip
dhclient

# Show information about listening ports
netstat -tulpen | less

ss -tuna

# Network scanner
sudo apt-get install nmap
nmap localhost

# DNS troubleshooting
dig nu.nl
  # dns file ==> /etc/resolv.conf

##### NETPLAN #####

# /etc/netplan/01-netcfg.yaml
sudo nano /etc/netplan/01-netcfg.yaml

network:
  version: 2
  ethernets:
   enp0s3:
    addresses: [192.168.2.112/24]
    gateway4: 192.168.2.1
    nameservers:
     addresses: [8.8.8.8, 8.8.4.4]

# Show dns results
systemd-resolve --status

# Apply
sudo netplan apply

####### SYSTEMD ############

# Install packages
apt install systemd-networkd systemd-resolved

# Remove network manager
systemctl disable --now NetworkManager

# Enable services
systemctl enable systemd-networkd
systemctl enable systemd-resolved

# Delete
rm /etc/resolv.conf

# Create symb link
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

# Create config folder
mkdir /etc/systemd/network

# Create config /etc/systemd/network/10-static-ens33.network
vim 10-static-ens33.network

[Match]
Name=ens33

[Network]
address=192.168.4.229/24
Gateway=192.168.4.2
DNS=127.0.0.1