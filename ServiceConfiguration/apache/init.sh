#!/bin/bash

# Install apache
apt install apache2 apache2-manual

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
