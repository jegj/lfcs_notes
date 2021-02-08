

# Main file: /etc/rsyslog/rsyslog.conf

# snap-in file: /etc/rsyslog.d

ss -tuna | grep 514


# provides TCP syslog reception
module(load="imtcp")
input(type="imtcp" port="514")

# Send logs entries to journactl
## /etc/rsyslog.d/listen.conf

*.* @192.168.86.56