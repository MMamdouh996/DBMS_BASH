#!/usr/bin/bash
echo -e "@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@  Create Database HERE  @@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
#list the existing databases here
cd ./DBs
ls
# read -p "Please Enter The Database Name : " DBname

while true
do
    read DBname
    if [[ ! $DBname =~ ^[a-zA-Z] ]]; then
        echo 0
        echo -n "Please Re-Enter The Database Name Considering the naming standards : "
        continue
     elif [[ -e $DBname ]]; then
        echo 'This Database Already Exist'
        echo -n "Please Type an Unexisted DB name : "
        continue
    else
        mkdir $DBname
        echo -e "Database "$DBname" Created Successfully\nat "$(date)
        break
    fi
done
