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
