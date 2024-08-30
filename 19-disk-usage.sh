#!/bin/bash 

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5  #in real project it is usually 75 

while IFS= read -r line 
do 
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6f}' | cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then 
        echo "$PARTITION is more than $DISK_THRESHOLD  current value: $USAGE please check"
    fi 
done <<< $DISK_USAGE 
