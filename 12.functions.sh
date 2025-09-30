#!/bin/bash

#by using function we can reduce repeated task lines. please compare 11.installingMysql.sh and 12.functions.sh

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "Please run this script with root privilege"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo "Error: Installing $2 is Failed"
        exit 1
    else 
        echo "Success: Installing $2 is Success"
    fi
}

dnf install mysql -y
validate $? "MySQL"  #passing args 'exit status' and 'MySQL'

dnf install nginx -y
validate $? "Nginx"

dnf install python3 -y
validate $? "Python 3"

