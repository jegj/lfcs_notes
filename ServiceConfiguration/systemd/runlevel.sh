#!/bin/bash

# Get default run level
systemctl get-default

# Set default run level
systemctl set-default multi-user.target

-poweroff.target => 0
-rescue.target => 1
-multi-user.target => 3
-graphical.target => 5
-reboot.target => 6
-emergency.target

# Switch run level
systemctl isolate multi-user.target