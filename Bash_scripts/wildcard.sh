#!/bin/bash
#
# SCRIPT: wildcard.sh
# AUTHOR: Kumar Pratik
# DATE:   31/08/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: Demo on use of wildcard.It creates two temp directory
#          and generates files in it and finally copy all file 
#          from one directory to other using wildcard.
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
mkdir /tmp/a
mkdir /tmp/b
touch /tmp/a/a1.txt
touch /tmp/a/a2.txt
touch /tmp/a/a3.html
touch /tmp/a/a4.html
cp /tmp/a/*.txt /tmp/b/
