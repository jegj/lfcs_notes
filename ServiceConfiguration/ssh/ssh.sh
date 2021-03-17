#!/bin/bash

# Docs:
man sshd_config

# 1) Create jegj user
useradd -s /bin/bash -m -c "ssh test user" -G sudo

# 2) Add password to jegj user
sudo passwd jegj

# 3) Change sshd to allow password access (Allowed by default)

# PasswordAuthentication yes
# PermitEmptyPasswords no
sed -i 's/^#PasswordAuthentication.*$/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/^#PermitEmptyPasswords.*$/PermitEmptyPasswords no/g' /etc/ssh/sshd_config
sed -i 's/^#PermitRootLogin.*$/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/^#PubkeyAuthentication.*$/PubkeyAuthentication yes/g' /etc/ssh/sshd_config

sudo systemctl restart sshd

# 2) Generate public/private rsa key pair
ssh-keygen

# 3) Copy the public pair
ssh-copy-id -i test_rsa.pub 192.168.86.56

# or

sudo mkdir /home/jegj/.ssh
sudo chown jegj:jegj /home/jegj/.ssh
sudo chmod 700 /home/jegj/.ssh
sudo touch /home/jegj/.ssh/authorized_keys
sudo chown jegj:jegj /home/jegj/.ssh/authorized_keys
sudo chmod 600 /home/jegj/.ssh/authorized_keys

# 4) Secure ssh access
sed -i 's/^#PasswordAuthentication.*$/PasswordAuthentication no/g' /etc/ssh/sshd_config
sudo systemctl restart sshd

ssh -i test.rsa jegj@192.168.86.56

ssh -l jegj 192.168.86.56

# 5) Match user config
# Example of overriding settings on a per-user basis
Match User linda
  X11Forwarding no
  AllowTcpForwarding no
  PermitTTY no
  ForceCommand cvs server
  PasswordAuthentication yes
