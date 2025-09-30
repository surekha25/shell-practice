#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "Error :: Please run this script with root privilege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error :: Installing Mysql is Failed"
    exit 1
else 
    echo "Success :: Installing Mysql is Success"
fi
