#!/usr/bin/bash
echo -e "\n\t\tBash Shell Scripting Project - DBMS\n\tOpen Source Applications Development - Intake 39\n\t\t\t   Mostafa Ali\n";
echo -e "                            \n    Creating Database    \n                            \n------------------------------------------"
cd ./DBs
echo -n "Please Insert Database Name: "

while true
do
    read DBname
    if [[ ! $DBname =~ ^[a-zA-Z] ]]; then
        echo -n "Please Re-Enter The Database Name Considering the naming standards: "
        continue
     elif [[ -e $DBname ]]; then
        echo 'This Database Already Exists'
        echo -n "Current Databases: " ;ls
        echo -n "Please Type an Unexisted DB name: "
        continue
    else
        mkdir $DBname
        echo -e "Database "$DBname" Created Successfully\nat "$(date)
        break
    fi
done
cd ..
