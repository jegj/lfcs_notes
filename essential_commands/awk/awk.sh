# First column
awk '{print $1}' sandbox/seindfield

# First and Third column
ls -l | awk '{print $1, $3}'

# Last column
ls -l | awk '{print $NF}'

# search
awk '/Dolores/ {print}' sandbox/seindfield

# delimiter
awk -F: '{print $1}' /etc/passwd

# replacement
echo "Hello Tom" | awk '{$2="Adam"; print $0}'

# Get the line with a length more than
awk 'length($0) > 15' sandbox/seindfield

# Change separator
 awk -F: '{print $1}' /etc/passwd

# Print conditional $NF **last field** in the record
cd /home/jegj
ls -l | awk '{if($NF == "snap") print $0}'

# Print how many columns have the input
ls -l | awk '{print NF}'

# Searching string at the start of the line
echo -e "Linux is free to use\n It is an open-source software\nLinuxHint is
 a popular blog site" | awk '/^Linux/'

# Searching string at the end of the line
echo -e "PHP Script\nJavaScript\nVisual Programming" | awk '/Script$/'

# awk case insensitive regex
echo -e "Web Design\nweb development\nFramework" | awk 'tolower($0) ~ /^web/;'