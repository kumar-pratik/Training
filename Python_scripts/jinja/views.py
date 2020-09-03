#!/usr/bin/env python3
#
# SCRIPT: Views.py
# AUTHOR: Kumar Pratik
# DATE:   03/09/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: A demo on using Jinja
# REV LIST:
#    DATE        : Date of revision
#    BY          : AUTHOR OF MODIFICATION
#    MODIFICATION: Describe the chages made. What do they enhance.
# 
# set -n   # Uncomment to check script syntax, without execution.
#          # Note: Do forget comment it back as it won't allow the 
#          # the script to execute.
#
# set +x   # Uncomment this for debugging this shell script.
#
#
################################################################
#          Define Files and Variables here                     #

################################################################
################################################################
#          Define Functions here                               #
################################################################
################################################################
#          Beginning of Main                                   #
from jinja2 import Template
with open('templates.html') as f:
    tmpl = Template(f.read())
print (tmpl.render(
    variable = 'Value with <unsafe> data',
    item_list = [1, 2, 3, 4, 5, 6]
))
################################################################
# End of script



