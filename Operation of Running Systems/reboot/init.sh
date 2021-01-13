#!/bin/bash


#1) Boot, reboot, and shut down a system safely
sudo shutdown -h +1 "Power Failure imminent" # shutdown with message
sudo shutdown -h now  #shutdown
sudo shutdown -r now  #reboot
sudo shutdown -r now 'Kernel upgrade requires reboot'
sudo reboot