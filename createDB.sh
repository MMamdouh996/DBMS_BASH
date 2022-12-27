#!/usr/bin/bash
function top1 { 
    echo -e "                            \n    Main Menu    \n                            \n------------------------------------------"
}

clear
echo -e "                            \n    Creating Database    \n                            \n------------------------------------------"

if [ ! -e DBs ]; then
    mkdir DBs
fi

cd ./DBs
echo -n "Please Insert Database Name: "
while true
do
    read DBname
    if [[ ! $DBname =~ ^[a-zA-Z_][a-zA-Z0-9]*$ ]]; then
        echo -e "The DB name you have inserted violate the naming standard of the DBMS which is
        1- DB name Cannot contain special Charcters (unless '_')
        2- Cannot start with numbers 
        3- Cannot have spaces"      
        echo -n "Please Re-Enter The Database Name Considering the naming standards: "
        continue
     elif [[ -e $DBname ]]; then
        echo -e '\nThis Database Already Exists\n'
        echo -n "Current Databases: " ;
        
        for line in $(ls -F | grep / |cut -d / -f1 | sort)
            do
            # Display the line
            echo -n "$line   "  
            done

            echo " "
        echo -n -e "\nPlease Type an Unexisted DB name: "
        continue
    else
        mkdir "$DBname"
        clear
        echo -e "\nDatabase '"$DBname"' Created Successfully\n\nat "$(date +%m/%d/%Y) "\n\n"
        break
    fi
done
top1
cd ..
