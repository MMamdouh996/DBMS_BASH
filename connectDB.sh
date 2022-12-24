#!/usr/bin/bash
clear
function top2 {
echo -e "                            \n    Connecting Database    \n                            \n------------------------------------------"
}
top2
echo -n "Current Databases is : "
cd ./DBs

for line in $(ls -F | grep / |cut -d / -f1 | sort)
do
  echo -n "$line   "  
done
echo -e "\n-------------------------------------------------- "

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
echo -e "Connected to '"$dbconn"' Database Succecssfully\n"
echo -e "Select the Action to be done from list \n\n"
cDB_list=("Create Table" "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table" "Exit")


select cDB in "${cDB_list[@]}"
do
    case $cDB in 
    "Create Table")
    createTable.sh "$dbconn"
    top2
    ;;
    "List Tables")
    listTable.sh "$dbconn"
    top2
    ;;
    "Drop Table")
    dropTable.sh "$dbconn"
    top2
    ;;
    "Insert into Table")
    insertintoTable.sh "$dbconn"
    top2
    ;;
    "Select From Table")
    selectfromTable.sh "$dbconn"
    top2
    ;;
    "Delete From Table")
    deletefromTable.sh "$dbconn"
    top2
    ;;
    "Update Table")
    updateTable.sh "$dbconn"
    top2
    ;;
    "Exit")
    break
    ;;
    *)
    clear
    top2
    echo -e "Wrong Input please re-insert your input from the menu \n"
    esac
      echo -e " 1) Create Table\n" "2) List Tables\n" "3) Drop Table\n" "4) Insert Into Table\n" "5) Select From Table\n" "6) Delete From Table\n" "7) Update Table\n" "8) Exit\n"
done
cd ..
