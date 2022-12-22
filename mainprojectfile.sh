#!/usr/bin/bash
MMenu_list=("Create Database" "List Databases" "Connect To Databases" "Drop Database" "Exit")


select MMenu in "${MMenu_list[@]}"
do
    # echo "Entered Do" #just a flag
    case $MMenu in
    "Create Database")
    echo "Create Database HERE @@@@@@@"
    createDB.sh
    echo "Creation Ended Well"
    ;;
    "List Databases") #its database(S) not s
    echo "List Database HERE @@@@@@@"
    listDB.sh
    echo "Listing Ended Well"
    ;;
    "Connect To Databases") #its database(S) not s
    echo "Connect To Database HERE @@@@@@@"
    connectDB.sh
    echo "Connecting Ended Well"
    ;;
    "Drop Database")
    echo "Drop Database HERE @@@@@@@"
    dropDB.sh
    echo "Dropping Ended Well"
    ;;
     "Exit")
    echo "EXIIIT HERE @@@@@@@"
    break
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    ;;
    *)
    echo "Wrong Input please re-insert your input from the menu "
    echo "menu again " # to be done later
    esac

done

echo "bye bye"