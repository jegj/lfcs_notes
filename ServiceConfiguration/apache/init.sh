#!/bin/bash

# Install apache
apt install apache2 apache2-doc

# Add a new direcoty entry for content
<Directory /web>
        AllowOverride None
        Require all granted
</Directory>

# Add sales.com to /etc/hosts
echo "127.0.0.1 sales.com" >> /etc/hosts

# Create custom logs
mkdir /web/logs

# Add new virtual host
<VirtualHost *:80>
        ServerName sales.com

        ServerAdmin webmaster@localhost
        DocumentRoot /web/sales

        ErrorLog /web/logs/error.log
        CustomLog /web/logs/access.log combined

</VirtualHost>

# restart apache
sudo systemctl restart apache2

# Restrict access to a web page

<Directory /web>
        AllowOverride All # IMPORTANT
        Require all granted
</Directory>

#.htaccess

## Deny access from IP
Order Deny,Allow
Deny from 192.168.86.57

## Grant access from IP
Order Allow,Deny
Allow from 192.168.86.57
