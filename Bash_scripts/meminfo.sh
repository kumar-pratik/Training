#!/bin/bash
#
# SCRIPT: meminfo.sh
# AUTHOR: Kumar Pratik
# DATE:   31/08/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: Script to show total memory, available memory, used memory and utilization percentage.
#          
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
free -t | awk 'NR == 2 {print "Total memory is : " $2}'
free -t | awk 'NR == 2 {print "Current used memory is : " $3}'
free -t | awk 'NR == 2 {print "Current free memory is : " $4}'
free -t | awk 'NR == 2 {print "Memory Utilization in percent  is : " $3/$2*100}'
