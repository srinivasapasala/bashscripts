#!/bin/bash

sudo yum install tomcat10 -y

if [ $? -eq 0 ]
then
echo " Tomcat10 installed successfully..!"
else
echo " Error: Tomcat10 Installation Failed.!!"
exit 1
fi
