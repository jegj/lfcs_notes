#!/bin/bash
# The sysctl interface can be used to read and tune kernel parameters at run time

# 1) Show kernel parameters
sysctl -a
sysctl -a | grep icmp

# 2) Edit kernel params with sysctl
sudo sysctl kernel.pid_max=2000
# or
echo 3000 > /proc/sys/kernel/pid_max

sysctl net.ipv4.icmp_echo_ignore_all
sysctl net.ipv4.icmp_echo_ignore_all=1

# 3) Make permanent
echo "net.ipv4.icmp_echo_ignore_all=1" >> /etc/sysctl.conf
sysctl -p

# https://www.kernel.org/doc/Documentation/


#### Use proc

echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6