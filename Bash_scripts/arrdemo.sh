#!/bin/bash
#
# SCRIPT: arrdemo.sh
# AUTHOR: Kumar Pratik
# DATE:   31/08/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: Demo on how to create, add, delete and filter an array
# REV LIST:
#    DATE        : 01/09/2020
#    BY          : Kumar Pratik
#    MODIFICATION: Added Comments
# 
# set -n   # Uncomment to check script syntax, without execution.
#          # NOTE: Do forget comment it back as it won't allow the 
#          # the script to execute.
#
# set +x   # Uncomment this for debugging this shell script.
#
#
################################################################
#Ways of array declaration
fruits[0]=apple
fruits[1]=oranges
fruits[2]=banana
fruits[3]=mango
fruits[4]=lichi
fruits[5]=berry

declare -a unix=("Red Hat" "Fedora" "Debian")

student=(Pratik John Richa Raunak)

################################################################
#Ways to print array
echo "Fruits are: ${fruits[@]}"
echo "Unix are: ${unix[@]}"
echo "Students are:${student[@]}"
echo ${fruit[1]}
echo ${fruit[3]}
echo ${unix[1]}

#Length of array and elements
echo ${#fruits[@]}
echo ${#fruits}
echo ${#fruits[2]}

#Extracting by offset and length
echo ${fruits[@]:1:2} # Prints 2 elements starting  from 1
echo ${fruits[1]:0:5} # Prints first 5 character of  index 1

#Search and replace in array
echo ${unix[@]/Debian/Ubuntu} # The changes does not permanently replaces the content in the array
echo ${unix[@]}

#Adding elements to the array
unix=(${unix[@]} "Ubuntu" "SUSE")
echo ${unix[@]}

#Removing an element from array
unset unix[3]
echo ${unix[3]}
echo ${unix[@]}

#Complete removal of an element
fruits=(${fruits[@]:0:3} ${fruits[@]:4})
echo ${fruits[@]}
echo ${fruits[3]}

#remove the entire array
unset student
echo ${student[@]}
