#!/bin/bash

# Install package
apt install squid

# Start and enable
systemctl enable --now squid

# Config file: /etc/squid/squid.conf
# port  3128
acl blockedsite url_regex ^http://.*.oracle.com/.*$
acl blockedsite url_regex ^https://.*.oracle.com/.*$