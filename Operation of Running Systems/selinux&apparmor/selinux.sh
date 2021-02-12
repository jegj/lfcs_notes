#!/bin/bash

# Install
sudo apt install selinux selinux-utils selinux-basics auditd audispd-plugins

# 1) Show SELinux state
getenforce

# 2) Define SELinux mode

setenforce Permissive
setenforce Enforcing

# 3)SHow context labels
ls -Z

# 4) Set context label to file
semanage-fcontext -a -t httpd_sys_content_t "/web(/.*)?"
restorecon -Rv /web

# 5) Get booleans
getselbool -a

# 6) Set booleans
setselbool -P ftpd_anon_write on