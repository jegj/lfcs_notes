# Reverse sort
sort -r sandbox/seindfield

# Sort by column
sort -k2 sandbox/seindfield

# Sort by column numerically
ls -lth > lsl.txt
sort -nk2 lsl.txt

# sort, merge and remove duplicates from these two files.
sort -u lsl.txt lsla.txt

# Sort by delimiter
sort -t ":" -nk3 /etc/passwd