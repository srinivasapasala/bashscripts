#!/bin/bash
# This script will rename a file
echo
ls
echo
echo Enter the file name to be renamed
read oldfilename
echo
echo Enter the new file name
read newfilename
echo
mv $oldfilename $newfilename
echo The file has been renamed as $newfilename
echo
ls
echo
