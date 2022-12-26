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
#-----------------------------
# read -p "Enter the Database Name: " dbname
# cd /home/mmamdouh/bash/Bash_Project_DBMS/DBs/test1
# table_insert=do7a
# number_columns_of_table=$(awk -F"/" '{ print NF-1 }' meta/$table_insert.meta)
# echo $number_columns_of_table
# declare -a list=""
# echo $list
# for i in $(seq 1 $number_columns_of_table )
# do
#     list+=$(head -1 do7a | cut -d"|" -f$i )'|'
#     echo $list
#     echo $i
# done
# lost1=()
# lost=("id" "name")

# echo $list
# x="2,3"
# sed -n '1p' do7do7
# cut -d"|" -f$x do7do7 | grep "do7aa" #|cut -d : -f1
# echo $lost
# echo ${lost[0]}
# echo ${lost[1]}
#----------------------------------------------------

lost=()
lost=("id" "age" "name")
var=3
wannted_output=()
set -x
for i in $(seq 0 $var )
do
    echo $i
    xx=$(head -1 do7do7 | cut -d"|" -f$(($i+1)) )
    if [[ ${lost[$i]} == $xx ]];then
        wannted_output+=$(($i+1)),
    echo $i
# sed -n 'LINE_NUMBERp' file.txt
    fi
done
echo $wannted_output
# cut -d"|" -f1,2,3 do7do7 | grep do7a 
set +x