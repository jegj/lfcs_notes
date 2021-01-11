#!/bin/bash

sudo useradd -m -s /bin/bash rocky
sudo useradd -m -s /bin/bash bullwinkle

# Edit /etc/group
sudo vigr

# groupadd
sudo groupadd friends
sudo groupadd bosses -g 490 # Define GID

# groupdel
sudo groupdel bosses
sudo groupdel friends

# groupmod
sudo groupmod bosses newbosses

# Add to group with usermod
sudo usermod -aG bosses,friends rocky
groups rocky

sudo usermod -aG friends bullwinkle
groups bullwinkle