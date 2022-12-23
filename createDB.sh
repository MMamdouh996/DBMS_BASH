#!/usr/bin/bash
clear
echo -e "                            \n    Creating Database    \n                            \n------------------------------------------"

# # Get the directory of the current executing file
# current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


# # Check if the folder exists
# if [ ! -d "${current_dir}/../DBs" ]; then
#   # Create the folder if it does not exist
#   mkdir "${current_dir}/../DBs"
# fi
# # Change the current working directory to the folder
# cd "${current_dir}/../DBs"
# #cd ./DBs

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
        echo 'This Database Already Exists'
        echo -n "Current Databases: " ;
        
        for line in $(ls -F | grep / |cut -d / -f1 | sort)
            do
            # Display the line
            echo -n "$line   "  
            done

            echo " "
        echo -n "Please Type an Unexisted DB name: "
        continue
    else
        mkdir "$DBname"
        pwd
        #clear
        echo -e "\nDatabase "$DBname" Created Successfully\n\nat "$(date) "\n\n"
        break
    fi
done
cd ..
