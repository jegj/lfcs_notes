#!/bin/bash

# install
apt install vsftpd

# Add anony
anonymous_enable=YES

# client
apt install lftp

# Use sftp
sftp <IP>