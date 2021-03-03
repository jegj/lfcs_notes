#! /bin/bash

# Set time from system time to hw time
hwclock -w

# Set time from hw time to system time
hwclock -s

## timedatectl

# Show current settings
timedatectl status

# Change timezone
timedatectl set-timezone America/Lima

##  NTP

timedatectl set-ntp OFF

# SHow NTP servers with stratum
chronyc sources

# Fetch and set the date
ntpdate pool.ntp.org