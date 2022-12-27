#!/usr/bin/bash
clear
echo -e "                            \n    update record    \n                            \n------------------------------------------"

#cd $1

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

update_options=("Update Record" "Exit")

select upd in "${update_options[@]}"
do

    case $upd in
        "Update Record")
            read -p "please insert the Value of the Primary key of your record : " pk_value
            check_input=`cut -d "|" -f1 do7do7 | grep -w $pk_value `
            column_pk=`$(head -1 do7do7 | cut -d"|" -f1 )`
            echo $check_input
            if [[ ! $check_input == "" && ! $check_input == "id" ]];then
                # read -p "which coulmn name"
                check=`cut -d "|" -f1 do7do7 | grep -n -w $pk_value | cut -d ":" -f1` 
                clear #line number of the input value
                sed -i "${check} d" do7do7
                # echo "reached the sed"
                        number_columns=$(awk -F"|" 'NR==1 { print NF-1 }' do7do7) 
                        # echo $number_columns
                        while true;
                        do
                                # echo $(head -1 do7do7 | cut -d"|" -f1 )

                                row_value=$pk_value"|"
                                # echo $row_value
                                
                                for i in $(seq 2 $number_columns)
                                do

                                column_name=$(head -1 do7do7 | cut -d"|" -f$i )
                                read -p "please insert the "$column_name" : " column_value
                                #check if the column_value matches datatype the proceed to the next loop

                                if [[ ! $i == $number_columns ]];then
                                row_value+=$column_value"|"
                                else
                                row_value+=$column_value
                                fi

                                done
                                echo $row_value
                                echo $row_value >> do7do7
                                break
                                
                        done
                
                echo -e "\n\nthe above record updated Successfuly\n"
                break
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

# cd ..