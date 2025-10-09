#!/bin/bash
ram_threshold=15 # in project we keep it as 80
ip_address=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
message=""

mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100}')
mem_usage=${mem_usage%.*}
if [ $mem_usage -ge $ram_threshold ]; then
    message+="<b>High Memory Usage</b>: $mem_usage% <br>"
fi

echo -e "Message Body: $message"

sh mail.sh "info@arunodhai.com" "High Memory Usage Alert" "High Memory Usage" "$message" "$ip_address" "Devops Team"

# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# MESSAGE_BODY=$4
# IP_ADDRESS=$5
# TO_TEAM=$6