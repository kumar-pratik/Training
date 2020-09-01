#!/bin/bash
#Ways of array declaration
fruits[0]=apple
fruits[1]=oranges
fruits[2]=banana
fruits[3]=mango
fruits[4]=lichi
fruits[5]=berry

declare -a unix=("Red Hat" "Fedora" "Debian")

student=(Pratik John Richa Raunak)

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
