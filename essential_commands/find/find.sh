#!/bin/bash

find /etc -size -100k

# Search starting from current position, descending maximum three directories levels, files with size major of 2 megabyte
find . -maxdepth 3 -type f -size +2M
find random5/ -maxdepth 3 -name "*random*" -type f  -exec rm -f '{}' \;

#  combine two conditions.
find . \( -name name1 -o -name name2 \)

# Find all files with permissions equal to 222. E.g. only file with permissions 222 will be showed
find . -perm 222

# Find all files with at least permissions 222. E.g. 777 match as valid.
find . -perm -222

# Find all files with write for owner or write for group or write for others (at least one)
find . -perm /222

# Find all files with at least permission write for group
find . -perm -g=w

# Find hard links
find simbolyc/ -samefile source/hard