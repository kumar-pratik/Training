#!/bin/bash
ntry_max=3
ntry=0
password=""
while [[ "$ntry" -lt "$ntry_max" ]]
do
	ntry=$(($ntry + 1))
	echo $ntry
	echo -n "Enter Password:"
	read -s password
	echo ""
	if [[ "$password" == "Linux" ]]
	then 
		echo "Congratulation"
		exit 0
	fi
	echo "Wrong Password"
done
echo "You failed $ntry_max times"
exit -1
