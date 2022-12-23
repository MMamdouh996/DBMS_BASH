#!/usr/bin/bash
clear
echo -e "                            \n    Deleting Database    \n                            \n------------------------------------------"
cd ./DBs


echo -n "Current Databases: "
for line in $(ls -F | grep / |cut -d / -f1 | sort)
do
  echo -n "$line   "  
done

echo -e " \n\n" 
echo -n "Please Insert Database Name to Delete : "

while true
do
    read DBdel
    echo " "
    if [[ -e $DBdel ]]; then
    clear
        rm -r $DBdel ## let's try to add Backup Feature later
        echo $DBdel' Database Deleted succussfully'
        break
    else
        echo -e "Database doesn't Exist on the System \n"
        echo -n "Please Re-insert Database Name to Delete : "
    fi
done
echo -e  '\n-------------------------------\n'
cd ..