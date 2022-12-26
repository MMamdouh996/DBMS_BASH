#!/usr/bin/bash
clear
echo -e "                            \n    Insert to Table    \n                            \n------------------------------------------"

cd $1
pwd
echo -n "which table you want to select from : "

while true;
do
    read table_insert
    echo -e "\n"
    if [[ -e $table_insert ]];then
       break
    else 
        echo 'you have inserted wrong table please re-insert : '
        continue
    fi
done
number_columns_of_table=$(awk -F"/" '{ print NF-1 }' meta/$table_insert.meta)
echo $number_columns_of_table
i=1

while [[ $i -le $number_columns_of_table ]];
do
    z=$(head -1 do7a | cut -d"|" -f$i )
    read -p "what is the condition value name you have : " condition_value
    echo -e "\n"
    
    # [ "$string1" != "$string2" ]
    if [[ "$condition_value" != "$z" ]];then
       echo 'you have inserted wrong table please re-insert : '
       continue
    fi

    read -p "what is the value of it : " condition_value_value
    echo -e "\n"
    #check if condition value if string he must put string etc TODO

    grep "$condition_value_value" $table_insert

    # sed -n 'LINE_NUMBERp' file.txt

    # [ "$string1" != "$string2" ]
    # if [[ "$condition_value_value" != "$z" ]];then
    #    echo 'you have inserted wrong table please re-insert : '
    #    continue
    # fi


    # i+=1
    # echo "end if"
done








#coulmn_name
# awk 2wsl lel $condation value type NR $1 wla $2 $3 we 25od el rakm we 2nzl beh grep fe cut

cut -d "|" -f "$condition_value" $table_insert
number_columns=$(awk -F"/" '{ print NF-1 }' meta/$table_insert.meta)


