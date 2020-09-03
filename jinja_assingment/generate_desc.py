#!/usr/bin/env python3
#
# SCRIPT: generate_desc.py
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
#          Imports Here                                        #
from jinja2 import Template
################################################################
################################################################
#          Define Files and Variables here                     #
employee_list = [{'eid':1010,'name':"Kumar Pratik", 'date':"10/09/20", 'role':"Intern"},
{'eid':1011,'name':"Vaibhav Tyagi", 'date':"10/08/20", 'role':"Intern"},
{'eid':1012,'name':"Himanshu", 'date':"10/09/20", 'role':"Devops Engineer"},
{'eid':1013,'name':"Vidushi", 'date':"10/09/20", 'role':"Devops Engineer"},]
template_file='/home/pratik/Training/jinja_assingment/discription.txt'
################################################################
################################################################
#          Define Functions here                               #
def print_discription(file, employees):
    with open(file) as f:
        tmpl = Template(f.read())
    print(tmpl)
    print (tmpl.render(employees=employees))
################################################################
################################################################
#          Beginning of Main                                   #
print_discription(file=template_file, employees=employee_list)
################################################################
# End of script



