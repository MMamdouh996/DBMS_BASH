#!/usr/bin/bash
clear

read -p "what is the column name : " column_name

    number_columns1=$(awk -F"|" 'NR==1 { print NF-1 }' $1)
    echo $number_columns1
    for i in $(seq 1 $number_columns1)
    do
        x=$(sed -n '1p' $1 | cut -d "|" -f$i )
        if [[ $x == $column_name ]];then
            req_column=$i
            break 
        fi

    done
    if [[ $req_column == "" ]]; then
    echo "you have inserted wrong column name"
    echo "Aborting @ @@ @@@ @@@@"
    else
        clear
        cut -d "|" -f$req_column $1   
    fi

# awk -F "|" -v i=0 '  {
#     i+=1
#     print i
#     # if ($column_name == "$i") {
#     #         print "apple"
#     #         } 
#     #         else {
#     #         print "not apple"
#     #         }
#     # print NF
#     # print $0 $1
# }' $1
# column_names=()