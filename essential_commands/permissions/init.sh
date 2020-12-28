#!/bin/bash

# Add exec to owner, group and other
chmod +x file

# Add write to group
chmod g+w file

# Remove read and write to others
chmod o-rw file

# Add suid
chmod 4760
# Owner: grant read, write and exec
# Group: grant read, write
# Others: no permission

# Add guid
chmod 2770

# set suid
chmod u+s file

# set guid
chmod g+s file

# set sticky bit
chmod +t dir