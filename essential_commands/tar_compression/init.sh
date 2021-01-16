# Encrypt
tar -cfv test.tar  sandbox

# Encrypt and gzip
tar -zcvf test.tar.gz sandbox

# Show content insize a tar or tar.gz
tar -tf tar -xvf test.tar
tar -ztf tar -xvf test.tar.gz

# Decrypt in current folder
tar -xvf test.tar
tar -zxvf test.tar.gz

# Decrypt in target folder
tar -C /tmp -zxvf test.tar.gz
tar --directory /tmp -zxvf test.tar.gz

# Append file to the archive. Note: the test.tar isn't compressed
tar --append -f sandbox.tar sandbox/test5

# Delete file from the archive. Note: the test.tar isn't compressed
tar --delete -f  sandbox.tar sandbox/test5

# Update file in test.tar. Note: the test.tar isn't compressed
tar --update -f sandbox.tar sandbox/test5

# Exclude file MPEG from content of file.tar
tar X<(ls | file -f - | grep -i MPEG | cut -d: -f 1) -c -f file.tar *

# Save all files of current directory in new bzip2 compressed file called file.tar.bz2
tar jcfv file.tar.bz2 *

# Extract content
tar jxfv file.tar.bz2

# Gzip compress
gzip test.tar

## Decompress
gzip -d test.tar.gz
gunzip test.tar.gz

# Backup file newer than a date
tar --create --newer '2011-12-1' -vf backup1.tar /var/tmp

tar --create --after-date '2011-12-1' -vzf backup1.tar /var/tmp
