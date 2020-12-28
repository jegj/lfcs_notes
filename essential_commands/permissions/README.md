# Advanced permissions

There are other special permissions that can be granted to file/dirctories

|                |         File         |                          Directory                          |
| :------------: | :------------------: | :---------------------------------------------------------: |
|    suid (4)    | Run as owner of file |                             N/A                             |
|    sgid (2)    |  Run as group owner  |       Inherit directory group when a file is created        |
| sticky bit (1) |         N/A          | A file can be deleted only by owner or by directory's owner |


- https://www.redhat.com/sysadmin/suid-sgid-sticky-bit
- https://www.thegeekdiary.com/what-is-suid-sgid-and-sticky-bit/#:~:text=Set%2Duser%20Identification%20(SUID)&text=The%20first%20s%20stands%20for,user%20who%20is%20running%20it.


## SUID
A file with SUID always executes as the user who owns the file, regardless of the user passing the command. If the file owner doesn't have execute permissions, then use an uppercase S here.

## SGID

this special permission has a couple of functions:

- If set on a file, it allows the file to be executed as the group that owns the file (similar to SUID)
- If set on a directory, any files created in the directory will have their group ownership set to that of the directory owner

## Sticky
This permission does not affect individual files. However, at the directory level, it restricts file deletion. Only the owner (and root) of a file can remove the file within that directory.