#!/bin/bash
#
# SCRIPT: iptables_chains.sh
# AUTHOR: Kumar Pratik
# DATE:   31/08/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: A UI script that prints all asks to select the iptable rules 
#          and displays all the rule of that perticular chain.
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

TempFile=$(mktemp)

ChainType=`zenity --width=400 --height=275 --list --radiolist \
     --title 'Iptables Chains' \
     --text 'Select the chain type:' \
     --column 'Select' \
     --column 'Scan Type' TRUE "filter" FALSE "nat" FALSE "mangle" FALSE "raw"`

if [[ $? -eq 1 ]]; then

  # they pressed Cancel or closed the dialog window 
  zenity --error --title="Search Declined" --width=200 \
       --text="Chain selection declined"
  exit 1
fi 

# search for hardware info with the appropriate value in $Flag
iptables -t $ChainType --list | tee >(zenity --width=200 --height=100 \
     --title="Collating Information" --progress \
     --pulsate --text="Checking rules..." \
     --auto-kill --auto-close) >${TempFile}
 
# Display the hardware info in a scrolling window
zenity --width=800 --height=600 \
     --title "Chain detail" \
     --text-info --filename="${TempFile}"
 
exit 0

