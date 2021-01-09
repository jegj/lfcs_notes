#!/bin/bash

# From remote to host
scp -i ~/.ssh/test jegj@192.168.86.56:/tmp/nodes.tar.gz /home/jegj/Desktop

# From host to remote
scp -i ~/.ssh/test /home/jegj/Desktop/test jegj@192.168.86.56:/tmp/nodes.tar.gz

# Directory
scp -r -i ~/.ssh/test_rsa  /home/jegj/Desktop/offsite jegj@192.168.86.56:/tmp