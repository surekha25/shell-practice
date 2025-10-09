#!/bin/bash

disk_usage=$(df -hT | grep -v Filesystem)
disk_threshold=2 # in project we keep it as 75

while IFS= read -r line
do
    usage=$($line | awk '{print $6}' | cut -d "%" -f1)
    partition=$($line | awk '{print $7}')
    if [ $usage -ge $disk_threshold ]; then
        echo "High Usage on $patition: $usage"
    fi
done <<< $disk_usage