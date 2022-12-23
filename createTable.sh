#!/usr/bin/bash
clear
echo -e "                            \n    Table Creating    \n                            \n------------------------------------------"

echo -n "Please Insert Table Name: "
cd DBs
echo " "
pwd
while true
do
    read Tabname
    if [[ ! $Tabname =~ ^[a-zA-Z_][a-zA-Z0-9]*$ ]]; then
        echo -e "The Table name you have inserted violate the naming standard of the DBMS which is
        1- Table name Cannot contain special Charcters (unless '_')
        2- Cannot start with numbers 
        3- Cannot have spaces"      
        echo -n "Please Re-Enter The Table Name Considering the naming standards: "
        continue
     elif [[ -e $Tabname ]]; then
        echo 'This Table Already Exists'
        echo -n "Current Tables : " ;
        
        for line in $(ls -F | grep / |cut -d / -f1 | sort)
            do
            # Display the line
            echo -n "$line   "  
            done

            echo " "
        echo -n "Please Type an Unexisted DB name: "
        continue
    else
        mkdir "$Tabname"
        pwd
        #clear
        echo -e "\nDatabase "$Tabname" Created Successfully\n\nat "$(date) "\n\n"
        break
    fi
done
cd ..
