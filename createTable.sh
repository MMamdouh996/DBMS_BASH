#!/usr/bin/bash
DATA_TYPES=("Integer" "String")
clear
echo -e "                            \n    Table Creating    \n                            \n------------------------------------------"

cd $1
mkdir meta 2> /dev/null

echo -n "Please Insert Table Name: "

while true
do
    read table_name
    if [[ ! $table_name =~ ^[a-zA-Z_][a-zA-Z0-9]*$ ]]; then
        echo -e "The Table name you have inserted violate the naming standard of the DBMS which is
        1- Table name Cannot contain special Charcters (unless '_')
        2- Cannot start with numbers 
        3- Cannot have spaces"      
        echo -n "Please Re-Enter The Table Name Considering the naming standards: "
        continue
     elif [[ -e $table_name ]]; then
        echo 'This Table Already Exists'
        echo -n -e "-------------------\nCurrent Tables : " ;
        
        for line in $(ls -F | grep / |cut -d / -f1 | sort)
            do
            echo -n "$line   "  
            done

            echo " "
        echo -n -e "-------------------\n-------------------\nPlease Type an Unexisted DB name: "
        continue
    else
        echo -n "How many Columns you need in the Table : " 
        read column_count
        #check if he inesrt a number or not and not equal to 0 TODO
        
        for current_column in $(seq 1 $column_count);
        do
            echo $current_column
                if [[ $current_column == 1 && ( -e $table_name || -e $table_name.meta ) ]];then
                    rm -r $table_name $table_name.meta 2> /dev/null
                fi
                if [[ $current_column == 1 ]];then
                    read -p "Enter the Primary Key column name : " column_name
                    else
                    read -p "Enter the column name : " column_name
                fi
            #check if name is correct TODO

            echo -e "\n1) Integer\n2) String"
            echo -e "\nSelect the Datatype of this column--- " 
            
            while true ; #selecting and inserting metadata
            do
                read column_datatype
                echo -e "\n1) integer\n2) String"
                #check if he isnert 1 or 2 from the menu TODO
                    if [[ $column_datatype == 1 && $current_column == 1 ]];then
                        echo -n "$column_name|" > $table_name
                        chmod +x $table_name
                        echo -n "$column_name:" > meta/$table_name.meta
                        echo -n "integer:" >> meta/$table_name.meta
                        echo -n "PrimaryKey/" >> meta/$table_name.meta
                        break
                    elif [[ $column_datatype == 2 && $current_column == 1 ]];then
                        echo -n "$column_name|" > $table_name
                        chmod +x $table_name
                        echo -n "$column_name:" > meta/$table_name.meta
                        echo -n "string:" >> meta/$table_name.meta
                        echo -n "PrimaryKey/" >> meta/$table_name.meta
                        break
                    elif [[ $column_datatype == 1 ]];then
                        echo -n "$column_name|" >> $table_name
                        echo -n "$column_name:" >> meta/$table_name.meta
                        echo -n "integer/" >> meta/$table_name.meta
                        break
                    elif [[ $column_datatype == 2 ]];then
                        echo -n "$column_name|" >> $table_name
                        echo -n "$column_name:" >> meta/$table_name.meta
                        echo -n "string/" >> meta/$table_name.meta
                        break
                    else
                        # clear
                        echo -n "you have selected wrong choice , please re-select your Datatype :"
                    fi

            done
            
        done
            
        echo " " >> $table_name
        clear
        echo -e "\nTable "$table_name" Created Successfully Inside DB "$1"\n\nat "$(date) "\n\n"
        break
    fi
done
echo " finish creating table"
cd ..

