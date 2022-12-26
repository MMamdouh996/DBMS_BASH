#!/usr/bin/bash
clear

columns_number=$(awk -F"|" 'NR==1 { print NF-1 }' do7do7 ) #$1

read -p "what is the condition name you have : " condition_name
echo $number_columns_of_table
echo $condition_value


 for i in $(seq 1 $columns_number)
    do
        x=$(sed -n '1p' do7do7 | cut -d "|" -f$i )
        if [[ $x == $condition_name ]];then
            echo "found"
            req_column=$i
            break 
        fi
    done

    if [[ $req_column == "" ]]; then
    echo "you have inserted wrong column name"
    echo "Aborting @ @@ @@@ @@@@"
    else

        read -p "what is the value of it : " condition_value
            # sed -n '1p' do7do7
            # grep -w $condition_value do7do7
        read -p "what is the required column name" output_name

        for i in $(seq 1 $columns_number)
            do
                z=$(sed -n '1p' do7do7 | cut -d "|" -f$i )
                if [[ $z == $output_name ]];then
                    echo "found output name"
                    output_column=$i
                    echo $i
                    break 
                fi
            done

            if [[ $output_column == "" ]]; then
                echo "you have inserted wrong column name"
                echo "Aborting @ @@ @@@ @@@@"
            else
                clear
                echo $output_name
                grep -w $condition_value do7do7 | cut -d "|" -f$output_column

        #         # awk -v var=$condition_value -v ou=$output_column ` BEGIN{ FS="|" }
        #         #         {  if ( $ou == var ) {
        #         #                 print $0

                #             }

                #         }
                # ` do7do7


                    # awk -v column=$output_column -v target="$condition_value" '
                    #             BEGIN{
                    #                                 FS="|"
                    #                     }
                    #                     {       print column
                    #                             print target
                    #                         if( $column == target ){
                    #                             print $0
                    #                         }
                    #                     }
                    #                     ' do7do7
            fi


    fi





    # i=1
    # while [[ $i -le $number_columns_of_table ]];
    # do
    #     z=$(head -1 do7do7 | cut -d"|" -f$i )
    #     read -p "what is the condition value name you have : " condition_value
    #     echo -e "\n"
        
    #     if [[ "$condition_value" != "$z" ]];then
    #        echo 'you have inserted wrong table please re-insert : '
    #        continue
    #     fi

    #     read -p "what is the value of it : " condition_value
    #     echo -e "\n"
    #     #check if condition value if string he must put string etc TODO

    #     grep ^"$condition_value_value" $table_insert

    #     # sed -n 'LINE_NUMBERp' file.txt

    #     # [ "$string1" != "$string2" ]
    #     # if [[ "$condition_value_value" != "$z" ]];then
    #     #    echo 'you have inserted wrong table please re-insert : '
    #     #    continue
    #     # fi


    #     # i+=1
    #     # echo "end if"
    # done


    # lost=()
    # lost=("id" "name")
    # var="3"
    # wannted_output=()
    # for i in $(seq 1 $var )
    # do
    #     list+=$(head -1 do7do7 | cut -d"|" -f$i )'|'
    #     echo $list
    #     echo $i
    # done













        
    #     #cut -d"|" -f($i) | grep -n ^"$i"$ do7do7 |cut -d : -f1
    #             #cut -d"|" -f2 do7do7 | grep -n ^"lord"$ |cut -d : -f1
    #     #cut -d"|" -f($i),($j) $t | grep "$" 



    # #coulmn_name
    # # awk 2wsl lel $condation value type NR $1 wla $2 $3 we 25od el rakm we 2nzl beh grep fe cut

    # cut -d "|" -f "$condition_value" $table_insert
    # number_columns=$(awk -F"/" '{ print NF-1 }' meta/$table_insert.meta)


