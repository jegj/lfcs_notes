#!/bin/bash

# - nodev
# - nosuid
# - noexec
# - ro

# Mount with options
sudo mount -o remount,noexec /mydata/

# Avoid hang out on boots
sudo mount -o default,nofail /mydata/

# Test your mount options
sudo mount -a