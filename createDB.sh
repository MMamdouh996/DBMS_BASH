#!/usr/bin/bash
echo "Create Database HERE @@@@@@@"
#list the existing databases here

read -p "Please Enter The Database Name : " DBname
# while (( ))

if [[ $DBname == /* ]]; then echo 1; else echo 0; fi

echo $DBname
# echo $DBname[0]
# echo $DBname[1]
# echo $DBname[2]
