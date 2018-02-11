#!/bin/bash

> /tmp/output.txt
for pkg in $(cat dados.result)
    do
        echo $pkg | awk -F"|" '{ print $1 " " $2}' | sed 's/.*/ & OFF/' >> /tmp/output.txt 
        #echo $pkg | awk -F| '{ print $1 $2}' "off" >> /tmp/output.txt
#        n=$[n+1]
done

dialog --checklist "Choose item:" 80 40 20 \
$(cat /tmp/output.txt)

#commented to check on script
#rm /tmp/output.txt
