#!/usr/bin/bash
MMenu_list=("Create Database" "List Databases" "Connect To Databases" "Drop Database" "Exit")

function top1 { 
    echo -e "                            \n    Main Menu    \n                            \n------------------------------------------"
}

top1

select MMenu in "${MMenu_list[@]}"
do

    # echo "Entered Do" #just a flag
    case $MMenu in
    "Create Database")
    createDB.sh
    
    ;;
    "List Databases") #its database(S) not s
    listDB.sh
    ;;
    "Connect To Databases") #its database(S) not s
    connectDB.sh
    echo "Connecting Ended Well" #removed Later
    ;;
    "Drop Database")
    dropDB.sh
    ;;
     "Exit")
    break
    ;;
    *)
    clear
    top1
    echo "Wrong Input please re-insert your input from the menu "
    
    esac
    
echo -e " 1) Create Database\n" "2) List Databases\n" "3) Connect To Databases\n" "4) Drop Database\n" "5) Exit\n" # to be done later
done

echo "bye bye"