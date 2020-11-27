#!/bin/bash

find /etc -size -100k

# Search starting from current position, descending maximum three directories levels, files with size major of 2 megabyte
find . -maxdepth 3 -type f -size +2M

find random5/ -maxdepth 3 -name "*random*" -type f  -exec rm -f '{}' \;