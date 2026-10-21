#!/bin/bash
ls -l /home/srini/check
if [ $? -eq 0 ]
then
echo File Exist
else
echo File does not exist
fi

