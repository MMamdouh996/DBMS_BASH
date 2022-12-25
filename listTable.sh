#!/usr/bin/bash
clear
cd $1
echo -e "                            \n    Tables Lisitng    \n                            \n------------------------------------------"
echo -n "Current Tables Are : "
for line in $(ls -F | grep "*" | sort)
    do
    # Display the line
    echo -n "$line   "  
    done
echo -e "\n------------------------------------------"
   

cd ..
