#!/bin/bash


#1) Boot, reboot, and shut down a system safely
shutdown -h now  #shutdown
shutdown -r now  #reboot
shutdown -r now 'Kernel upgrade requires reboot'
reboot