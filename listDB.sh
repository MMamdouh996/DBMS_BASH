#!/usr/bin/bash
clear
echo -e "                            \n    Listing Databases    \n                            \n------------------------------------------"
cd ./DBs

echo -n "Current Databases: "
for line in $(ls -F | grep / |cut -d / -f1 | sort)
do
  # Display the line
  echo -n "$line   "  
done

echo -e " \n\n"
cd ..