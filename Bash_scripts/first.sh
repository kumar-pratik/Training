#!/bin/bash
#
# SCRIPT: first.sh
# AUTHOR: Kumar Pratik
# DATE:   31/08/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: Demo on different varions on way to echo msgs.
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
# This is a comment!
echo "Hello      World"       #Hello      World
echo "Hello World"	      #Hello World
echo "Hello * World"          #Hello * World
echo Hello * World            #Hello all the files in the directory World
echo Hello      World         #Hello World
echo "Hello" World            #Hello World
echo Hello "     " World      #Hello       World
echo "Hello "*" World"        #Hello * World
echo `hello` world            #command not found error  world
echo 'hello' world            #hello world
