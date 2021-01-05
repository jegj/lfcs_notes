#!/bin/bash

# - -20 (the highest priority)
# - +19 (the lowest priority)

## nice
nice -n 5 ls -ltha

## renice is used to raise or lower the nice value of an already running process

# 1) Print priority
ps lf

# 2) Make process lower priority
sudo renice 5 8182

# 3) Make process higher priority
sudo renice -5 8182