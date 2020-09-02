#!/bin/bash
#
# SCRIPT: check free space through /proc/meminfo file
# AUTHOR: Kumar Pratik
# DATE:  02/09/2020
# REV:    1.1.A 
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: Script to show total memory, available memory, used memory and utilization percentage.
#          
# REV LIST:
#    DATE        : 02/09/2020
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
#          Define Files and Variables here                     #
#path to meminfo file located in /proc directory.
path="/proc/meminfo"
################################################################
################################################################
#          Define Functions here                 		#
checkMemory_Grep(){
    echo "Showing memory using grep."
	totalmemory=$(grep -i "MemTotal" $path)
	freememory=$(grep -i "MemFree" $path)
	availablememory=$(grep -i "MemAvailable" $path)
	echo $totalmemory
	echo $freememory
	echo $availablememory

}
checkMemory_Awk(){
    echo "Showing memory using awk."
    totalmemory=$(awk '/MemTotal/{print}' $path)
    freememory=$(awk '/MemFree/{print}' $path)
    availablememory=$(awk '/MemAvailable/{print}' $path)
    echo $totalmemory
	echo $freememory
	echo $availablememory
}
checkMemory_Sed(){
    echo "Showing memory using sed."
    totalmemory=$(sed -n '/MemTotal/p' $path)
    freememory=$(sed -n '/MemFree/p' $path)
    availablememory=$(sed -n '/MemAvailable/p' $path)
    echo $totalmemory
	echo $freememory
	echo $availablememory
}
################################################################
################################################################
#          Beginning of Main                                   #
checkMemory_Grep
checkMemory_Awk
checkMemory_Sed
################################################################
# End of script