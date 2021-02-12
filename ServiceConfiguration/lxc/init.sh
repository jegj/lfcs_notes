#!/bin/bash

# Create a lxc container
lxc-create -t download -n <containername>

# List containers
lxc-ls -f

# Start and run in backgrounds
lxc-start -n <containername> -d

# Stop
lxc-stop -n <containername>

# SHow info about the cotnainer
lxc-info -n <contianername>