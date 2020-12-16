#!/bin/bash

# Split file into 2 line files
split -l 2 countries separate_file

# Combining
cat test1 test2 test3 > test_123