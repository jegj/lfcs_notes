#!/bin/bash

# Default config => /etc/logrotate.conf

##############
/var/log/pgagent/*.log {
  daily
  rotate 5
  dateext
  missingok
  compress
  delaycompress
  notifempty
  copytruncate
}