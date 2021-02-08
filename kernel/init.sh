#!/bin/bash

# Show current mods
lsmod

# Display info about mod
modinfo vfat

# Load module
modprobe vfat

# Unload module
modprobe -r vfat

