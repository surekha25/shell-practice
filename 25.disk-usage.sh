#!/bin/bash

disk_usage=$(df -hT | grep -v Filesystem)
disk_threshold=2 # in project we keep it as 75
ip_address=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
message=""

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    partition=$(echo $line | awk '{print $7}')
    if [ $usage -ge $disk_threshold ]; then
        message+="High Usage on $partition: $usage % \n"
    fi
done <<< $disk_usage

echo -e "Message Body: $message"