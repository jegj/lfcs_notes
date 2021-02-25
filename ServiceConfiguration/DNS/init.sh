#!/bin/bash

############## DNS Server

# Install package
apt install bind9

# /etc/bind/named.conf.options
# Allow local network
options {
  listen-on port 53 { 127.0.0.1; 192.168.86.57};
  allow-query 	{ localhost; 192.168.86.0/24; };
  recursion yes;
  forwarders {
        8.8.8.8;
        8.8.4.4;
  };
}

# /etc/bind/named.conf.local
zone "sales.me.com." IN {
    type master;
    file "/var/named/sales.me.com.zone";
};
zone "0.168.192.in-addr.arpa" IN {
    type master;
    file "/var/named/0.162.198.in-addr.arpa.zone";
};


# Restart
systemctl restart bind9

# /etc/netplan/01-netcfg.yaml
sudo nano /etc/netplan/01-netcfg.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      dhcp4: no
      addresses:
        - 192.168.121.199/24
      gateway4: 192.168.121.1
      nameservers:
          addresses: [192.168.86.57]

# Apply
sudo netplan apply

############ Caching DNS Server

# Install package
apt install unbound

# /etc/unbound/unbound.conf

interfaces: 0.0.0.0
access-control: 192.168.86.0/24
forward-zone:
        name: "."
        forward-addr: 8.8.8.8

domain-insecure: mydomain.local


# /etc/netplan/01-netcfg.yaml
sudo nano /etc/netplan/01-netcfg.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      dhcp4: no
      addresses:
        - 192.168.121.199/24
      gateway4: 192.168.121.1
      nameservers:
          addresses: [192.168.86.57]

# Apply
sudo netplan apply