# User and Group Managament

## useradd

- `-c` Any text string. It is generally a short description of the login, and is currently used as the field for the user's full name.
- `-e` date after which the/ user will be disabled
- `-g` primary group. NOTE: if not specified it will be created a new group with same name of user that will be become user's primary group
- `-G` secondary groups
- `-m` create home directory. Useless because CREATE_HOME is yes
- `-p` configure password. NOTE: value must be provided encrypted.Normally password is not provided during user add
- `-s` shell to use


lock an account = preventing password based authentication we can lock the account password: