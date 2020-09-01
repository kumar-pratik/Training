#/bin/bash
free -t | awk 'NR == 2 {print "Total memory is : " $2}'
free -t | awk 'NR == 2 {print "Current used memory is : " $3}'
free -t | awk 'NR == 2 {print "Current free memory is : " $4}'
free -t | awk 'NR == 2 {print "Memory Utilization in percent  is : " $3/$2*100}'
