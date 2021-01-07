#!/bin/bash

ps aux


# 1) Print priority
ps l

# 2) Get process under postgres user
ps lf -U postgres

# 2) Show all process(-e) and Format columns
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu

# 2) show all process(-e) with a graphical view of processes tree
ps -eo pid,args --forest

# Lists open files associated with process id of pid
lsof -p <pid>

# show background jobs
jobs