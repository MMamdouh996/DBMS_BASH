#!/usr/bin/bash
DATA_TYPES=("Integer" "String")
clear
echo -e "                            \n    Table Creating    \n                            \n------------------------------------------"

function check_str() {
    str=$1
    while [[ ! $str =~ ^[a-zA-Z_][a-zA-Z0-9]*$ ]]
    do

            read -p "Please Re-Enter The requirment Considering the naming standards: " str
    done
    # return $str
    
}
function check_int() {
    int_value=$1
    while [[ ! $int_value =~ ^[1-9]+[0-9]*$ ]]
    do

            read -p "Please Re-Enter The requirment Considering the naming standards: " int_value
    done  
    return $int_value
}
function check_dt() {
    dt_value=$1
    while [[ ! $dt_value =~ ^[1-2]$ ]]
    do
            read -p "Please Re-Enter The requirment Considering the naming standards: " dt_value
    done
    return $dt_value
    
}






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
        echo -e '\nThis Table Already Exists'
        echo -n -e "-------------------\nCurrent Tables : " ;
        for line in $(find -maxdepth 1 -type f |cut -d / -f2) #$(ls -F | grep / |cut -d / -f2 | sort)
            do
            echo -n "$line   "  
            done

            echo " "
        echo -n -e "-------------------\nPlease Type an Unexisted DB name: "
        continue
    else
        echo -n "How many Columns you need in the Table [maximum 99 columns]: " 
        
        while true;
        do
            read column_count
            if [[ ! $column_count =~ ^[1-9]+[0-9]*$ ]]; then   
                echo -n "Please Re-Enter INTEGERS ONLY and not equal 0 : "
                continue
            fi
            break
        done
        
        for current_column in $(seq 1 $column_count);
        do
                if [[ $current_column == 1 && ( -e $table_name || -e $table_name.meta ) ]];then
                    rm -r $table_name $table_name.meta 2> /dev/null
                fi
                if [[ $current_column == 1 ]];then
                    read -p "Enter the Primary Key column name : " column_name
                    check_str $column_name
                    else
                    echo -e "\n"
                    read -p "Enter the column name : " column_name
                    check_str $column_name
                fi
            #check if name is correct TODO

            
            while true ; #selecting and inserting metadata
            do
                echo -e "\n1) integer\n2) String\n"
                read -p "Select the Datatype of this column--- " column_datatype
                #check if he insert 1 or 2 from the menu TODO
                    # check_dt $column_datatype

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

            done #kest nehyt el satr
            
        done
        # sed -i 's/.$//' $table_name
        echo " " >> $table_name
        clear   
        echo -e "\nTable "$table_name" Created Successfully Inside DB "$1"\n\nat "$(date) "\n\n"
    
    fi
    break
done
echo "finish creating table"
cd ..

