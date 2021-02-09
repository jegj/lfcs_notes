#!/bin/bash
sudo apt install firewalld

sudo systemctl [start/stop/enable] firewalld
systemctl disable --now firewalld

firewall-cmd --list-all

# Get current selected zone
firewall-cmd --get-default-zone

# Get active zones
firewall-cmd --get-active-zones

# Get rules on the zones
sudo firewall-cmd --list-all

# Get available zones
sudo firewall-cmd --get-zones

# Get rules by zone
sudo firewall-cmd --zone=home --list-all

# Transition interface to zone
sudo firewall-cmd --zone=home --change-interface=eth0

# Change default zone
sudo firewall-cmd --set-default-zone=home

# Make changes permanent
sudo firewall-cmd --runtime-to-permanent

# Add a firewall rule using iptables syntax
firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 1 -p tcp -m tcp --dport 80 -j ACCEPT

# Get all services
firewall-cmd --get-services

# Add http service to public zone
sudo firewall-cmd  --zone=public --add-service=http

# Add a permanent change
sudo firewall-cmd  --zone=public --permanent --add-service=http

### If service is not listed

# Open a port in your zone
sudo firewall-cmd  --add-port 4000-4005/tcp
sudo firewall-cmd  --permanent --add-port 4000-4005/tcp

# List ports
sudo firewall-cmd --zone=public --list-ports

# Close port
sudo firewall-cmd --remove-port=4000/tcp

### Define a service
sudo cp /usr/lib/firewalld/services/ssh.xml /etc/firewalld/services/example.xml

# <?xml version="1.0" encoding="utf-8"?>
# <service>
#   <short>SSH</short>
#   <description>Secure Shell (SSH) is a protocol for logging into and executing commands on remote machines. It provides secure encrypted communications. If you plan on accessing your machine remotely via SSH over a firewalled interface, enable this option. You need the openssh-server package installed for this option to be useful.</description>
#   <port protocol="tcp" port="22"/>
# </service>

# <?xml version="1.0" encoding="utf-8"?>
# <service>
#   <short>Example Service</short>
#   <description>This is just an example service.  It probably shouldn't be used on a real system.</description>
#   <port protocol="tcp" port="7777"/>
#   <port protocol="udp" port="8888"/>
# </service>

sudo firewall-cmd --reload

### Create your own zone

sudo firewall-cmd --permanent --new-zone=publicweb
sudo firewall-cmd --permanent --new-zone=privateDNS

sudo firewall-cmd --zone=publicweb --add-service=ssh
sudo firewall-cmd --zone=publicweb --add-service=http
sudo firewall-cmd --zone=publicweb --add-service=https
sudo firewall-cmd --zone=publicweb --list-all

sudo firewall-cmd --zone=privateDNS --add-service=dns
sudo firewall-cmd --zone=privateDNS --list-all

sudo systemctl restart network
sudo systemctl reload firewalld

# https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-firewalld-on-centos-7
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-viewing_current_status_and_settings_of_firewalld