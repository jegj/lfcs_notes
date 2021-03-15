#!/bin/bash

## postfix
apt install postfix

# PORT: 25

# Configure /etc/postfix

# /etc/postfix/master.cf

# /etc/postfix/main.cf

inet_interfaces = all
inet_protocols = ipv4
myorigin = $mydomain

mydestination= $mydomain

mynetworks= 168.100.189.24 #subnet

systemctl restart postfix

## dovecot mutt
apt install dovecot mutt


# /etc/dovecot/dovecot.conf
protocols = imap pop4 lmtp
listen = *, ::

# /etc/dovecot/conf.d/10-mail.conf
mail_location = ****

systemctl restart dovecot
systemctl enable dovecot

# Add user to mail group
usermod -aG mail linda

# Connect to mutt
mutt -f imap://linda@localhost
