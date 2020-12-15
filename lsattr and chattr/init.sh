# Set a file as immutable
sudo chattr +i test

# Set immutable whole directory
sudo chattr -R +i myfolder

# Append data without Modifying existing data on a File
chattr +a example.txt

# Remove attr
chattr -a example.txt
sudo chattr -i test
sudo chattr -R -i myfolder

# Print attrs
sudo lsattr test