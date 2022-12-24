#!/usr/bin/bash
clear
MMenu_list=("Create Database" "List Databases" "Connect To Databases" "Drop Database" "Exit")

function top1 { 
    echo -e "                            \n    Main Menu    \n                            \n------------------------------------------"
}

top1

select MMenu in "${MMenu_list[@]}"
do

    case $MMenu in
    "Create Database")
    createDB.sh
    ;;
    "List Databases")
    listDB.sh
    clear
    top1
    ;;
    "Connect To Databases")
    connectDB.sh
    clear
    top1
    # echo "Connecting Ended Well" #removed Later
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
    echo -e "Wrong Input please re-insert your input from the menu \n"
    
    esac
    
echo -e " 1) Create Database\n" "2) List Databases\n" "3) Connect To Databases\n" "4) Drop Database\n" "5) Exit\n" # to be done later
done

echo "bye bye"