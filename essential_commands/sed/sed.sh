#!/bin/bash

# Replace a word
sed 's/Dolores/Chicken/g' sandbox/test

# Replace a word and update the file
sed -i 's/Dolores/Chicken/g' sandbox/test

# Save result to file but keep an copy of original file with name file.orign
sed -i.orign 's/Dolores/Chicken/g' sandbox/test

# In any row of file, it will change all occurrences of source to target. Ignore case = case insensitive. Print all rows
sed 's/dolores/Chicken/gI'

# For row 13, it will change first occurrence of source to target. Print all rows
sed '13s/Dolores/TARGET/' sandbox/test

# Replace word except by line 25
sed '25!s/Dolores/s/g' sandbox/test

# In any row of file, it will change first occurrence of source to target. Print only changed rows
sed -n 's/Dolores/TARGET/p'

# Replace with empty
sed 's/Dolores//g' sandbox/test

# Replace tabs with spaces
sed 's/\t/ /g' sandbox/test


######## DELETE

# Delete line that match word
sed '/Dolores/d' sandbox/test

# Delete empty lines
sed '/^$/d' sandbox/test

# Delete by line number
sed -n 12d sandbox/test # line 12 and no print new result
sed '1d' sandbox/test # first line
sed '1,3d' sandbox/test # 1 to 3
sed 12,18d sandbox/test # 12 to 18

######## ADD

# It will insert newline as line 11
sed '11inewline' sandbox/test

########### PRINT

# Show lines from 12 to 18
sed -n 12,18p sandbox/test

# In any row of file, it will change first occurrence of source to target. Print only changed rows
sed -n 's/source/target/p'

# It will print only rows that contain source
sed -n '/source/p' file
