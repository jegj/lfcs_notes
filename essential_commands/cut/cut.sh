# First letter
cut -c1  sandbox/seindfield

# Select chars at spot 1,3,5,7
cut -c1,3,5,7  sandbox/seindfield

# Range
cut -c1-7  sandbox/seindfield

# Bytes
cut -b1-7  sandbox/seindfield

# Delimiter + field
cut -d: -f 1 /etc/passwd

# Range+Delimiter + field
cut -d: -f 1-2 /etc/passwd

# complement
echo "12345678" | cut -c 2,4,6 --complement # 13578
