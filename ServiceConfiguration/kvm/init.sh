#!/bin/bash

libvirtd

# List all vms
virsh list --all

# Start a vm
virsh start <name>

# Edit config
virsh edit <name>

# reboot
virsh reboot <name>

# Enable autostart
virsh autostart <name>

# destroy
virsh destroy <name>

# clone
virt-clone --original=myvm --name=myvm-clone file=/var/lib/libvirt/images/myvm.qcow2

