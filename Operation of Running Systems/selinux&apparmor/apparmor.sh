#!/bin/bash

sudo apt install apparmor apparmor-profiles apparmor-utils

# Show current state
aa-status

# Create new profile

cp /usr/bin/vim /usr/local/bin/kim
aa-genprof kim

# Enforce mode on kim
aa-enforce /usr/local/bin/kim








