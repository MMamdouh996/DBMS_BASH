#!/usr/bin/bash
clear
cd $1
echo -e "                            \n    Tables Lisitng    \n                            \n------------------------------------------"
echo -n "Current Tables Are : "
for line in $(find -maxdepth 1 -type f |cut -d / -f2 | sort)
    do
    echo -n "$line   "  
    done
echo -e "\n------------------------------------------"
   

cd ..
