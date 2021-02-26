# Visudo

Syntax : User <space> OnHost = (Runas-User:Group) <space> Commands

e.g `root ALL = (ALL:ALL) ALL`

Read it as `User Root can Run Any Command as Any User from Any Group on Any Host.`

1) The first ALL is used to define HOSTS. We can define Hostname/Ip-Address instead of ALL. ALL means any host.

2) Second ALL : Third ALL is User:Group. Instead of ALL we can define User or User with the group like User:Group. ALL:ALL means All users and All groups.

3) Last ALL is the Command. Instead of ALL, we can define a command or set of commands. ALL means all commands.


`who where = (as_whom) what`

ansible  ALL = ( ALL:ALL) NOPASSWD:ALL
ansible  ALL = ( ALL:ALL) NOPASSWD:/sbin/iptables



- https://medium.com/kernel-space/linux-fundamentals-a-to-z-of-a-sudoers-file-a5da99a30e7f
- https://www.sudo.ws/man/1.7.10/sudoers.man.html
- https://fossies.org/linux/sudo/examples/sudoers