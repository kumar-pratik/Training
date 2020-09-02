#!/bin/bash
#
# SCRIPT: check_pass.sh
# AUTHOR: Kumar Pratik
# DATE:   31/08/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: A demo script for password verification. Gives you 3 tries
#          to input the password. Desired Password is Linux.
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
#################################################################
ntry_max=3
ntry=0
password=""
################################################################
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
exit 1
