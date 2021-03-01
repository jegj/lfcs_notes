#!/bin/bash

# PORT =>   3128
# Install package
apt install squid

# Start and enable
systemctl enable --now squid

# Config file: /etc/squid/squid.conf
acl blockedsite url_regex ^http://.*.oracle.com/.*$
acl blockedsite url_regex ^https://.*.oracle.com/.*$