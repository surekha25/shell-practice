#!/bin/bash
cpu_threshold=-5 # in project we keep it as 80
ip_address=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
message=""

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
cpu_usage=${cpu_usage%.*}  # remove decimal
if [ $cpu_usage -ge $cpu_threshold ]; then
    message+="<b>High CPU Usage</b>: $cpu_usage% <br>"
fi

echo -e "Message Body: $message"

sh mail.sh "info@arunodhai.com" "High CPU Usage Alert" "High CPU Usage" "$message" "$ip_address" "Devops Team"

# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# MESSAGE_BODY=$4
# IP_ADDRESS=$5
# TO_TEAM=$6