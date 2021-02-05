#!/bin/bash

# Queries are done using the apt-cache
sudo apt install apt-file
sudo apt-file update

# 1) Search repository for package apache2
apt search apache2

# 2) Display basic information about the apache2 package
apt show apache2

# 3) Display more detailed information about the apache2 package
apt showpkg apache2

# 4) List depends
apt depends apache2

# 5) Search the repository for a file named apache2.conf
apt-file search apache2.conf

# 6) List all files in the apache2 package
apt-file list apache2

# 7)Synchronize the package index files with their repository sources
sudo apt update

# 8)Install new packages or update an already installed package
sudo apt install [package]

# 9)Remove a package from the system without removing its configuration files
sudo apt remove [package]

# 10)Remove a package from the system, as well as its configuration files:
sudo apt --purge remove [package]

# 11)Apply all available updates to packages already installed:
sudo apt upgrade

# 12)Do a smart upgrade that will do a more thorough dependency resolution and remove some obsolete packages and install new dependencies:
sudo apt dist-upgrade

# 13)Get rid of any packages not needed anymore, such as older Linux kernel versions:
sudo apt autoremove

# 14)Clean out cache files and any archived package files that have been installed:
sudo apt clean