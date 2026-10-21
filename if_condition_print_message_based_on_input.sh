#!/bin/bash
#clear
echo
echo "What is your name?"
echo
read a
echo
echo Hello $a sir
echo
echo "Do you like working in IT? (y/n)"
read Like
echo
if [ "$Like" == y ]
then
echo You are cool
elif [ "$Like" == n ]
then
echo You should try IT, it’s a good field
echo
fi

