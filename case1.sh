#!/bin/bash
echo
echo Please chose one of the options below:
echo 'a = Display Date and Time'
echo 'b = List file and directories'
echo 'c = List Users logged in'
echo 'd = Check System Uptime'
echo
	read choices

	case $choices in
a) date;;
b) ls;;
c) who;;
d) uptime;;
*) echo Invalid Choice - Bye.

	esac

