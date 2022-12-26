#!/usr/bin/bash
# clear
# echo -e "                            \n    Creating Database    \n                            \n------------------------------------------"
# cd ./DBs
# echo -n "Please Insert Database Name: "
# read word

# function regexcheck {
#     if [[ ! $1 =~ ^[a-zA-Z_][a-zA-Z0-9]*$ ]]; then
#         echo -e "The DB name you have inserted violate the naming standard of the DBMS which is
#             1- DB name Cannot contain special Charcters (unless "_")
#             2- Cannot start with numbers 
#             3- Cannot have spaces"      
#         echo -n -e "Please Re-Enter The Database Name Considering the naming standards: \n\n"
#         return 0
#     else
#     echo fine
#         return 1
#     fi
#     }
#     # echo "$(regexcheck "$word")"
# regexcheck "$word"

# # while true
# # do
# #     read DBname
# #     echo -e "\n"
    

#      if x=1 ; then 
#      echo test  
#      elif [[ -e $DBname ]]; then
#         echo 'This Database Already Exists'
#         echo -n "Current Databases: " ;ls
#         echo -n "Please Type an Unexisted DB name: "
#         continue
#     else
#         mkdir $DBname
#         echo -e "Database "$DBname" Created Successfully\nat "$(date)
#         break
#     fi
# done
# cd ..

# read -p "Enter the Database Name: " dbname
