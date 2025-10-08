#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ]; then
    echo "Please run this script with root priviliege"
    exit 1;
fi

log_folder="/var/log/shell-script"
script_name=$( echo $0 | cut -d "." -f1 )
log_file="$log_folder/$script_name.log"

mkdir -p $log_folder
echo "Script Started and Executed at: $(date)" | tee -a $log_file

source_dir=/home/ec2-user/app-logs

if [ ! -d $source_dir ]; then
    echo "Error: Source Directory Doesn't Exit;"
    exit 1
fi

files_to_delete=$(find $source_dir -name "*.log" -type f -mtime +14)

while IFS= read -r filepath 
do
    echo "Deleting the file : $filepath"
done <<< $files_to_delete