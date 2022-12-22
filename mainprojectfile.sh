#!/usr/bin/bash
MMenu_list=("Create Database" "List Databases" "Connect To Databases" "Drop Database" "Exit")


select MMenu in "${MMenu_list[@]}"
do
    # echo "Entered Do" #just a flag
    case $MMenu in
    "Create Database")
    createDB.sh
    echo "Creation Ended Well"
    continue
    ;;
    "List Databases") #its database(S) not s
    listDB.sh
    echo "Listing Ended Well"
    ;;
    "Connect To Databases") #its database(S) not s
    connectDB.sh
    echo "Connecting Ended Well"
    ;;
    "Drop Database")
    dropDB.sh
    echo "Dropping Ended Well"
    ;;
     "Exit")
    break
    ;;
    *)
    echo "Wrong Input please re-insert your input from the menu "
    echo "menu again " # to be done later
    esac

done

echo "bye bye"