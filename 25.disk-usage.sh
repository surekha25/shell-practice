#!/bin/bash

disk_usage=$(df -hT | grep -v Filesystem)
disk_threshold=2 # in project we keep it as 75
ip_address=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
message=""

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    partition=$(echo $line | awk '{print $7}')
    if [ $usage -ge $disk_threshold ]; then
        message+="High Usage on $partition: $usage% <br>"
    fi
done <<< $disk_usage

echo -e "Message Body: $message"

sh mail.sh "info@arunodhai.com" "High Disk Usage Alert" "High Disk Usage" "$message" "$ip_address" "Devops Team"

# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# MESSAGE_BODY=$4
# IP_ADDRESS=$5
# TO_TEAM=$6