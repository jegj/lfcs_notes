#!/bin/bash

# if [ -z $1 ]
# then
#   echo you have to provide an argument
#   exit 6
# fi

# echo the argument is $1

# COUNTER=$1
# while [ $COUNTER -gt 0]
# do
#   echo you still have $COUNTER seconds left
# done

# for i in $(seq 1 2 20)
# do
#    echo "Welcome $i times"
# done

# for VARIABLE in 1 2 3 4 5 .. N
# do
# 	command1
# 	command2
# 	commandN
# done

users=$(awk -F , '{ print $1 }' ldapusers | sed 's/cn=//g')

createUser(){
  useradd -m -s /bin/bash $1
}

for i in $users
do
  createUser $i
done

echo done!