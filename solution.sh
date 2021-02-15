#!/bin/bash

# 1) Working with files
find / -type f -size +100M > /tmp/bigfiles 2> /dev/null

ln /tmp/bingfile /root

# 2) Users and permisison

# Edit /etc/login.defs  and INACTIVE=90
# Add file data to /etc/skel

groupadd profs
groupadd students

useradd -m -s /bin/bash -G profs anna
useradd -m -s /bin/bash -G profs anouk

useradd -m -s /bin/bash -G students linda
useradd -m -s /bin/bash -G students lisa

chmod 3770 /data/students

mkdir /data/profs -p
mkdir /data/students -p
chgrp students /data/students/
chgrp profs /data/profs/
chmod g+wrx students/
chmod g+wrx profs/

chmod g+s students/
chmod g+s profs

chown anna students/
chown anna profs

chmod +t students/
chmod +t profs

# 3) Storage

# - Create partitions first
vgcreate vgexam /dev/sdb1 /dev/sdc1

lvcreate -L 1.8G -n vgexam vgexam

mkfs.ext4 /dev/vgexam/vgexam

find /etc -type f -size +1M -exec cp {}  /exam \;

lvcreate --snapshot --size 100m --name lvexam-snap vgexam/vgexam

# systemd mount template => /usr/share/systemd/tmp.mount

# 4) networking

hostnamectl set-hostname server1.mydomain.local

apt install systemd-networkd systemd-resolved

systemctl disable --now NetworkManager
systemctl enable --now systemd-networkd
systemctl enable --now systemd-resolved

rm /etc/resolv.conf


ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

mkdir /etc/systemd/network


# 5) Containers

docker run --name=my_busybox --rm -ti -v /data:/data busybox sleep 7200
