#!/bin/bash

# Use umask to specify permissions to be removed/blocked from
# the default permissions, which are 666 for files and 777 for directories

# Show current umask
umask # 0002
umask -S

# Remove write access to group
umask 0022

umask 27
# touch file1 # should be rw-r-----
umask 77
# touch file4 # should be -rw-------

# Define the permissions with symbolic mode
umask u=rw,g=r,o=r
