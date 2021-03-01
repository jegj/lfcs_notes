#!/bin/bash

sudo apt-get install iptables
systemctl enable --now iptables

# Check the status of your current iptables configuration
sudo iptables -L -v

sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m state --state=ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A OUTPUT -m state --state=ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate=ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
# OPTIONAL sudo iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -P INPUT DROP
# OPTIONAL  iptables -P OUTPUT DROP

# Allow to set the rule in line 1
iptables -I INPUT  1 -i lo -j ACCEPT

# Enable traffic http,icmp

sudo iptables -A INPUT -p icmp -j ACCEPT
sudo iptables -A OUTPUT -p icmp -j ACCEPT

sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Accept By source
sudo iptables -A INPUT -s 192.168.1.3 -j ACCEPT

# Drop By source
sudo iptables -A INPUT -s 192.168.1.3 -j DROP

# Reject by source
sudo iptables -A INPUT -s 59.45.175.62 -j REJECT
sudo iptables -A INPUT -s 59.45.175.0/24 -j REJECT

# Range of ips
sudo iptables -A INPUT -m iprange --src-range 192.168.1.100-192.168.1.200 -j DROP

# Dropping all other traffic
sudo iptables -A INPUT -j DROP

# Clean rules
sudo iptables -F

# Clean all input
iptables -F INPUT

# Show line numbers
sudo iptables -L --line-numbers

# Delete by line number
sudo iptables -D INPUT 3

# persist changes
sudo /sbin/iptables-save > /etc/sysconfig/iptables

apt search iptables-persistent