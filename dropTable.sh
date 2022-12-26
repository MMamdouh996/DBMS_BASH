#!/usr/bin/bash
clear
echo -e "                            \n    Table Creating    \n                            \n------------------------------------------"

cd $1

echo -n "Current Tables Are : "
for line in $(find -maxdepth 1 -type f |cut -d / -f2 | sort)
    do
    echo -n "$line   "  
    done
echo -e "\n------------------------------------------"

echo -n -e "\nPlease Insert Table Name to Delete : "

while true
do
    read deltab
    if [[ -e $deltab ]]; then
    clear

        rm meta/$deltab.meta $deltab ## try to add Backup Feature later TODO
        echo $deltab' Table Deleted succussfully'
        echo  "------------------------------------------"
        break
    else
        echo -e "\nTable doesn't Exist on the Database \n"
        echo -n "Please Re-insert Table Name to Delete : "
    fi
done

cd ..
