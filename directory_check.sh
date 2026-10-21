#!/bin/bash

DIR="/home/ubuntu/bashscripts/sample"

if [ -d "$DIR" ]; 
then
echo "Directory already exists"
else
mkdir -p "$DIR"
echo "Directory created successfully"
echo
ls
fi
