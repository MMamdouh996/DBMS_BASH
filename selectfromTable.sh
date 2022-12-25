#!/usr/bin/bash
clear
echo -e "                            \n    Insert to Table    \n                            \n------------------------------------------"

cd $1

read -p "which table you want to select from : " table_insert
# check if table exist or no first

read -p "what is the condition value you have : " condition_value
#coulmn_name
# awk 2wsl lel $condation value type NR $1 wla $2 $3 we 25od el rakm we 2nzl beh grep fe cut

cut -d "|" -f "$condition_value" $table_insert
number_columns=$(awk -F"/" '{ print NF-1 }' meta/$table_insert.meta)


