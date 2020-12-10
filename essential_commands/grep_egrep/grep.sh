# Basic usage
grep jegj /etc/passwd

# Count keys
grep -c Bob sandbox/seindfield

# Ignore Upper Lower case
grep -i Seinfeld sandbox/seindfield

# Display matched lines
grep -ni Seinfeld sandbox/seindfield

# Invert match
grep -vi Seinfeld sandbox/seindfield

# MOre keys
egrep  -i "Seinfeld|Bhatt" sandbox/seindfield
# SAME === grep  -E "Seinfeld|Bhatt" sandbox/seindfield

# Regular expression
grep '^foo$' sandbox/seindfield

# match digits
grep 'foo[0-9][0-9]' sandbox/seindfield