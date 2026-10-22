#!/bin/bash

#FILE=/home/ubuntu/bashscripts/data.txt
#sed -i '$d' $FILE sed -i '$d' $FILE sed -i '$d' $FILE

echo
cat -n data.txt
echo
sed -i "$(($(wc -l < data.txt) - 2)),\$d" data.txt
echo
cat -n data.txt
echo
echo Last 3 lines deleted successfully!
echo
