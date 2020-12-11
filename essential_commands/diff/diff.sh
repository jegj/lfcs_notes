# Show 2 columns
diff file1 file2 -y

# report only when files differ
diff file1 file2 -q

# report when two files are the same
diff file1 file2 -s

# Use cmp
cpm file1 file2