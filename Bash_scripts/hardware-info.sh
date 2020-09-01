#!/bin/bash
#
# SCRIPT: hardware-info.sh
# AUTHOR: Kumar Pratik
# DATE:   01/09/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: A UI script that displays hardware informations.
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
TempFile=$(mktemp)

ListType=`zenity --width=400 --height=275 --list --radiolist \
     --title 'Hardware Scan' \
     --text 'Select the scan type:' \
     --column 'Select' \
     --column 'Scan Type' TRUE "Short" FALSE "Long"`

if [[ $? -eq 1 ]]; then

  # they pressed Cancel or closed the dialog window 
  zenity --error --title="Scan Declined" --width=200 \
       --text="Hardware scan skipped"
  exit 1
 
elif [ $ListType == "Short" ]; then

  # they selected the short radio button 
  Flag="--short"
 
else

  # they selected the long radio button 
  Flag="" 
fi

# search for hardware info with the appropriate value in $Flag
hwinfo $Flag | tee >(zenity --width=200 --height=100 \
     --title="Collating Information" --progress \
     --pulsate --text="Checking hardware..." \
     --auto-kill --auto-close) >${TempFile}
 
# Display the hardware info in a scrolling window
zenity --width=800 --height=600 \
     --title "Hardware Details" \
     --text-info --filename="${TempFile}"
 
exit 0

