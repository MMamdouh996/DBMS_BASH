#!/usr/bin/bash
echo "Create Database HERE @@@@@@@"
#list the existing databases here

read -p "Please Enter The Database Name : " DBname
while true
    do

    if [[ $DBname =~ ^[A-Za-z_] ]]; then
        echo 1;
        break
        echo "test"

        else
        echo 0
        read -p "Please Re-Enter The Database Name Considering the naming standards : " DBname
        
    fi
done
if [ -d ./DBs/$DBname ];then
    echo "Thise Database Already Exist\n\nPlease Type a Unexisted DB name "
else
    echo "not found"
fi
if  [[ $DBname =~ ]];then


fi


echo $DBname ' Database created  ' $(date)
# echo $DBname[0]
# echo $DBname[1]
# echo $DBname[2]
