#!/bin/bash
#
# SCRIPT: env_variable
# AUTHOR: Kumar Pratik
# DATE:   31/08/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: Demo on working of special variables in bash. Script
#          must be run with some command line arguments to  get 
#          the desired result.
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
echo "\$0 = $0"
echo "\$1 = $1"
echo "\$2 = $2"
echo "\$* = $*"
echo "\$@ = $@"
echo "\$# = $#"

