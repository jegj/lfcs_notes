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

if [[ ( $username == "admin" && $password == "secret" ) ]]; then
echo "valid user"
else
echo "invalid user"
fi

if [[ ( $n -eq 15 || $n  -eq 45 ) ]]
then
echo "You won the game"
else
echo "You lost the game"
fi

if [[ ( $username == "admin" && $password == "secret" ) ]]; then
echo "valid user"
else
echo "invalid user"
fi


#!/bin/bash
file='book.txt'
while read line; do
echo $line
done < $file


#!/bin/bash
filename=$1
if [ -f "$filename" ]; then
echo "File exists"
else
echo "File does not exist"
fi


users=$(awk -F , '{ print $1 }' ldapusers | sed 's/cn=//g')

createUser(){
  useradd -m -s /bin/bash $1
}

for i in $users
do
  createUser $i
done

echo done!

# Redirection

# stderr to stdout
ls -l > output.txt 2>&1
ls -l &> output.txt