#!/usr/bin/bash
clear
echo -e "                            \n    Insert to Table    \n                            \n------------------------------------------"

cd $1

echo -n "Current Tables Are : "
for line in $(find -maxdepth 1 -type f |cut -d / -f2 | sort)
    do
    echo -n "$line   "  
    done
echo -e "\n------------------------------------------"


echo -n "which table you want to select from : "

while true;
do
    read table_insert
    echo " "
    if [[ -e $table_insert ]];then
       break
    else 
        echo 'you have inserted wrong table please re-insert : '
        continue
    fi
done

select_options=("Select All" "Select a Column" "Select a Cell" "Exit")

while true;
do
    echo "while"
    select selectt in "${select_options[@]}"
    do
    echo "select"
    case $selectt in
    "Select All")
    selectall.sh $table_insert  #DONE
    break
    ;;
    "Select a Column")
    selectcolumn.sh $table_insert  #DONE
    break
    ;;
    "Select a Cell")
    selectcell.sh $table_insert 
    break
    ;;
    "Exit")
    break
    ;;
    *)
    echo 'You have selected a wrong input , please re-select from the menu : '
    break
    esac
    done
    break

done
