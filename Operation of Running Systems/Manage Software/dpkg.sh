#!/bin/bash

# 1) List all packages installed
dpkg -l

# 2) List files installed in the wget package
dpkg -L wget

# 3)Show information about an installed package
dpkg -p wget

# 4)Show information about a package file:
dpkg -I webfs_1.21+ds1-8_amd64.deb


# 5) List files in a package file:
dpkg -c webfs_1.21+ds1-8_amd64.deb

# 6) Show what package owns /etc/init/networking.conf:
dpkg -S /etc/init/networking.conf

# 7) Show the status of a package:
dpkg -s wget

# 8) Verify the installed package's integrity:
dpkg -V package