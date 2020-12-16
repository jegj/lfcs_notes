#!/bin/bash

# Replace a word
sed 's/Dolores/Chicken/g' sandbox/test

# Replace a word and update the file
sed -i 's/Dolores/Chicken/g' sandbox/test

# Replace with empty
sed 's/Dolores//g' sandbox/test

# Delete line that match word
sed '/Dolores/d' sandbox/test

# Delete empty lines that match word
sed '/^$/d' sandbox/test

# Delete by line
sed '1d' sandbox/test # first line
sed '1,3d' sandbox/test # 1 to 3

# Replace tabs with spaces
sed 's/\t/ /g' sandbox/test

# Show lines
sed -n 12,18p sandbox/test

# Show Everything except lines - Delete lines
sed 12,18d sandbox/test

# Replace word except by line 25
sed '25!s/Dolores/s/g' sandbox/test