#!/bin/bash

# Get ACLs
getfacl test_file
getfacl test_folder

# Providing ACL for an individual User( Recursive )
setfacl -mR u:test:rwx test_folder/

# Providing ACL for all users of a group
setfacl -m g:testg:w test_folder/

# Default ACL entries
# To facilitate management of ACLs, you can define a default ACL in a directory; 
# it will then be automatically inherited by an object.
setfacl -Rm g:postgres:rwx,d:g:postgres:rwx ./GEN/finstmt

# Revoking an specific acl entry of a user/group
setfacl -x u:test,g:testg test_folder/

# Revoke all entries
setfacl -b test_folder