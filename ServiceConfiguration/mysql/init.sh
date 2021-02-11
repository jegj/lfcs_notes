#!/bin/bash

# Install mysql
apt install mysql-server

# Start mysql
systemctl start mysql

# Secure installation
mysql_secure_installation

# Access as root mysql user
mysql -u root -p

# Create a simple database

create database people;
use people;
create table users(firstname VARCHAR(20), lastname VARCHAR(20));
insert into users values('linda', 'flores')