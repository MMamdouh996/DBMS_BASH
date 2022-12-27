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

delete_options=("Delete Records" "Exit")

while true;
do
    
    select del in "${delete_options[@]}"
    do
        case $del in
        "Delete Records")
            read -p "please insert the Value of the Primary key of your record : " pk_value
            check_input=`cut -d "|" -f1 $table_insert | grep -w $pk_value `
            echo $check_input
            if [[ ! $check_input == "" ]];then
                check=`cut -d "|" -f1 $table_insert | grep -n -w $pk_value | cut -d ":" -f1`
                clear
                sed -n "${check}p" $table_insert
                sed -i "${check} d" $table_insert
                echo -e "\n\nthe above record Deleted Successfuly\n"
            else
                echo "the input value doesn't match any of the Primary Keys values"
                echo "Aborting"
                break
            fi
            break
        ;;
        "Exit")
            break
        ;;
        *)
            echo 'You have selected a wrong input , please re-select from the menu : '
        ;;
        esac

    done
    break
done
cd ..