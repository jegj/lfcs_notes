#!/bin/bash

# Install
sudo apt install selinux selinux-utils selinux-basics auditd audispd-plugins

# 1) Show SELinux state
getenforce

# 2) Define SELinux mode

setenforce Permissive
setenforce Enforcing

# TODO:l Apply labels

# - https://www.linode.com/docs/guides/how-to-install-selinux-on-ubuntu-18-04/