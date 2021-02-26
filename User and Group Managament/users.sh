#!/bin/bash

# Edit /etc/passwd and /etc/shaow
sudo vipw
sudo vipw -s

# Print defaults configuration
useradd -D

# - /etc/login.defs
# - /etc/default/useradd
# - /etc/skel -> skeleton all file are copied

# Create user
sudo useradd dexter

sudo useradd -s /bin/csh -m -k /etc/skel -c "Test user" bmoose
sudo useradd -s /bin/bash -m -e 2021-01-10 -f 2 -c "My test user with expiration" tuser

# Delete accounts
sudo userdel dexter
sudo userdel dexter -r # delete home directory
sudo userdel dexter -f # Delete user though he is logged

# Modify accounts
sudo usermod -s /bin/bash dexter
sudo usermod -L dexter # Lock user password
sudo usermod -U dexter # Unlock user passwod
sudo chage -E 2014-09-11 dexter #Another way to lock an account is to use chage the expiration date of an account to a date in the past

# Verify account is locked
passwd --status dexter

# Change password
passwd
sudo passwd dexter

# Lock account
sudo passwd -l dexter

# Unlock account
sudo passwd -u dexter

# Expire password
sudo passwd -e dexter

# Password Aging
sudo chage -d 0 dexter # force user to change password next login
chage -E "2021-01-10" dexter # Define expiration date for the account
chage -M 60 dexter # Max numbers day before password changing
chage -m 5 dexter # Min numbers day before password changing
chage -I 6 dexter # Force account to be locked after n number of inactivity days
chage -W 6 dexter # days of warning before password expires