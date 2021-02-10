#!/bin/bash

# Get default run level
systemctl get-default

# Set default run level
systemctl set-default multi-user.target

# Switch run level
systemctl isolate multi-user.target