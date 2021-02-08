#!/bin/bash

# Print unit
systemctl cat httpd.service
systemctl cat sshd.service

# Print all options ofr the unit
systemctl show httpd.service

# Edit unit
systemctl edit sshd.service

# Update units
systemctl daemon-reload

# Print status
ststemctl status sshd.service -l

# Making systemd journald persistence

## 1) Edit /etc/systemd/journald.conf
Storage=Persistent

## 2) Create directory
mkdir /varl/log/journal

systemctl force-reload systemd-journald