#!/usr/bin/bash
clear

cat $1 | sed 's/|$//'
echo -e "Table "$1" is displayed now \n"