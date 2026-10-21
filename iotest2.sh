#!/bin/bash
# we need to use the ticks(apostrophes) if you want to use this 
# in echo or else not required
a=`hostname`
echo Hello, my name is $a
echo
echo what is your name?
read b
echo
echo Hello $b
echo
