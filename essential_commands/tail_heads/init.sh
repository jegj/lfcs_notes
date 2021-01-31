#!/bin/bash

# Print last 5 lines
ls -lth | tail -n 5

# Invert and print anything but the first line
ls -lth | tail -n +2

# Print the whole file
ls -lth | tail -n +1

# Print first 5 lines
ls -lth | head -n 5

# Invert and print anything except the last 2 lines
ls -lth | head -n -2

# Print the whole file
ls -lth | tail -n -0