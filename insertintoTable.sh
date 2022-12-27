#!/usr/bin/bash
clear
echo -e "                            \n    Insert to Table    \n                            \n------------------------------------------"

cd $1

read -p "which table you want to insert into : " table_insert

while [[ ! -e $table_insert ]]
do
        echo -e "\nThis Database Already Exists\n"
        read -p "please re-insert an existed table : " table_insert
        
done

number_columns=$(awk -F"/" '{ print NF-1 }' meta/$table_insert.meta)
while true;
do
        # echo $(head -1 $table_insert | cut -d"|" -f1 )

        row_value=""
        for i in $(seq 1 $number_columns)
        do
                echo $i
                column_name=$(head -1 $table_insert | cut -d"|" -f$i )
                echo $column_name
                read -p "please insert the "$column_name" : " column_value
                #check if the column_value matches datatype the proceed to the next loop
                # if [[ ! $i == $number_columns ]];then
                row_value+=$column_value"|"
                # else
                # row_value+=$column_value
                # fi
                

        done
        echo $row_value >> $table_insert
        read -p "press 'y' to repeat inserting , any other key to exit : " repeating
        if [[ ! $repeating == 'y' ]];then
                break
        fi
done