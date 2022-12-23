#!/usr/bin/bash
clear
echo -e "                            \n    Connecting Database    \n                            \n------------------------------------------"

echo "Connect To Database HERE @@@@@@@"
cd ./DBs

for line in $(ls -F | grep / |cut -d / -f1 | sort)
do
  echo -n "$line   "  
done
echo " "

echo -n "Which Databases you want to use : "
while true;
do
    read dbconn
    if [[ -e $dbconn ]]; then
    
    break

    else
    echo "Database Doesn't Exist in the System "
    echo -n "Please Re-select a valid Database name: "
    fi
done

cd $dbconn
clear
echo -e "                            \n    Connecting Database    \n                            \n------------------------------------------"
echo "Connected to '"$dbconn"' Database Succecssfully"
echo -e "                            \n    Connecting Database    \n                            \n------------------------------------------"
echo -e "Select the Action to be done from list \n\n"
cDB_list=("Create Table" "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table")


select cDB in "${cDB_list[@]}"
do
    case $cDB in 
    "Create Table")
    createTable.sh "$dbconn"
    ;;
    "List Tables")
    createTable.sh "$dbconn"
    ;;
    "Drop Table")
    createTable.sh "$dbconn"
    ;;
    "Insert into Table")
    createTable.sh "$dbconn"
    ;;
    "Select From Table")
    createTable.sh "$dbconn"
    ;;
    "Delete From Table")
    createTable.sh "$dbconn"
    ;;
    "Update Table")
    createTable.sh "$dbconn"
    ;;
    "Exit")
    break
    esac
done
echo finish connecting