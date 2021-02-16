#!/bin/bash

systemctl cat tmp.mount

# Mount unit => /etc/systemd/system/backups.mount

[Unit]
Description=
Documentation=man:hier(7)
DefaultDependecies=no
Conflicts=umount.target
Before=local-fs.target umount.target

[Mount]
Where=/backups
What=/dev/sdb1
Type=ext4
Options=defaults

[Install]
WantedBy=multi-user.target

# Reload daemon
systemctl daemon-reload

# Enable the mount and start it
systemctl enable --now backups.mount

### Network dependecies

[Unit]
Description=Samba dir
Documentation=man:hier(7)
Conflicts=umount.target
After=network.target

[Mount]
What=//master/myfiles
Where=mnt
Type=cifs
Options=_netdev,username=anna,password=12345,uid=vagrant,gid=vagrant

[Install]
WantedBy=local-fs.target

#### AutoMount unit => /etc/systemd/system/backups.automount
[Unit]
Description=Automount backups

[Automount]
Where=/backups

[Install]
WantedBy=multi-user.target

# Reload daemon
systemctl daemon-reload

# Enable the mount and start it
systemctl disable --now backups.mount

# Enable automount
systemctl enable --now backups.automount