#!/bin/bash

sudo ufw enable/disable

# Allow
sudo ufw allow ssh

# Reject
sudo ufw reject out ssh

# Allow all outgoing
ufw default allow outgoing

# Show current status
sudo ufw status

# Destination, prot and port
ufw allow proto tcp from 192.168.86.56/32  to any port 5433 comment 'postgres access'

# Block incoming connections
sudo ufw default deny incoming

# Delete rule
sudo ufw delete reject out ssh

# Remove all rules
sudo ufw reset

# SHow app list
sudo ufw app list

# SHow info about samba
sudo ufw app info Samba

# Turn on logging
sudo ufw logging on