# Common Chattr Attributes and Flags

| Flag |                Definition                |
| :-------: | :--------------------------------------: | :--------: | :-------------------: |
|     a     |            can only be open in append mode for writing.             |
|     i     |            cannot be modified (immutable). Means no renaming, no symbolic link creation, no execution, no writable, only superuser can unset the attribute             |
|     A     |            no atime updates             |
|     c     |            File automatically compressed on the disk by the kernel             |
