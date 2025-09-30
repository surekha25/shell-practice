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

validate(){
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 ... $R Failure $N" | tee -a $log_file
        exit 1
    else
        echo -e "Installing $2 ... $G Success $N" | tee -a $log_file
    fi
}

for package in $@
do
    dnf list installed $package &>>$log_file
        if [ $? -ne 0 ]; then
            dnf install $package -y &>>$log_file
            validate $? "$package"
        else
            echo -e "$package already installed ... $Y Skipped $N" | tee -a $log_file
        fi
done