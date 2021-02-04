#!/bin/bash

# SHow ip config
ip a

# Add a new ip
ip a a dev eth0 1.2.3.4/8

# Hostname details
hostnamectl status

# Set hostname
hostnamectl set-hostname vagrant.test.com
  # /etc/nsswitch.conf to change the order resolution

# Show the default gateway
ip route show

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