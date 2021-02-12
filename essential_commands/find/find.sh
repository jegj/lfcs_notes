#!/bin/bash

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

# Search starting from current position, descending maximum three directories levels, files with size major of 2 megabyte
find . -maxdepth 3 -type f -size +2M

# Search in /etc all files/directories with size less of 100 kilobytes
find /etc -size -100k

# It will show all files that aren't owned by user owner. ! means negation, but must be escaped by \ to not be interpreted by bash shell
find . \! -user owner

#To find any file which are writable by all (the file owner, group and everyone else),
find -perm -a=w

#In this case the permission bits mentioned must be present for the file. For example, if you do
#find -perm -666 and if a file has 776, it will be matched. Similarly 666, 777 etc will be matched
#too, but 665 won't be matched. In summary, the mentioned (three) bits must be a subset of
#the permission bits.

find -perm -mode:

#Here any one bit of subset would do. For example, if we do find -perm /666, and if a file
#has 644, the file will be matched because the user permission bit is 6, and we are looking
#for a single bit subset. Similarly, 700, 060, 006 etc will be matched, but not e.g. 444, as
# no bit contains any subset of the required permission bits.

find -perm /mode:

# exactly 14 days ago
find ~/Documents -name "*.py" -type f -mtime 14

# more than 14 days ago
find ~/Documents -name "*.py" -type f -mtime +14

# less than 14 days ago
find ~/Documents -name "*.py" -type f -mtime -14

# atime -- access time = last time file opened
# mtime -- modified time = last time file contents was modified
# ctime -- changed time = last time file inode was modified