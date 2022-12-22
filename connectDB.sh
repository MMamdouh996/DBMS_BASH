#!/usr/bin/bash
echo "file is wokring Well"
cDB_list=("Create Table" "List Table" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table")


select cDB in "${cDB_list[@]}"
do
echo 1
done