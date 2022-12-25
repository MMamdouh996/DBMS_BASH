#!/usr/bin/bash
clear
echo -e "                            \n    Insert to Table    \n                            \n------------------------------------------"

cd $1

read -p "which table you want to insert into : " table_insert
# check if table exist or no first

number_columns=$(awk -F"/" '{ print NF-1 }' meta/$table_insert.meta)

echo $(head -1 do7a | cut -d"|" -f1 )

row_value=""
for i in $(seq 1 $number_columns)
do
      
        column_name=$(head -1 do7a | cut -d"|" -f$i )
        read -p "please insert the "$column_name" : " column_value
        #check if the column_value matches datatype the proceed to the next loop
        row_value+=$column_value"|"
        

done
echo $row_value >> $table_insert

testssss
