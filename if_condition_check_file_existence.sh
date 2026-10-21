#!/bin/bash
#Purpose: Check the specified file exists or not
#clear
if [ -e /home/srini/data.txt ]
        then
        echo "File exist"
        else
        echo "File does not exist"
fi

