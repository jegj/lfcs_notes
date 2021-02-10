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
WantedBy=local-fs.target

# Reload daemon
systemctl daemon-reload

# Enable the mount and start it
systemctl enable --now backups.mount

#### AutoMount unit => /etc/systemd/system/backups.automount

[Automount]
Where=/backups

# Reload daemon
systemctl daemon-reload

# Enable the mount and start it
systemctl disable --now backups.mount

# Enable automount
systemctl enable --now backups.automount