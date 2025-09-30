#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ]; then
    echo "Error: Please run this script with root priviliege"
    exit 1
fi

Log_Folder="/var/log/shell-script"
script_name=$( echo $0 | cut -d "." -f)
Log_file="$Log_Folder/$script_name.log"

mkdir -p $Log_Folder
echo "Script Started Executer at: $(date)" | tee -a $Log_file

validate(){
    if [ $1 -ne 0] ; then
       echo -e "Installing $2 ... $R Failure $N" | tee -a $Log_file
       exit 1
    else
        echo -e "Installing $2 ... $G Success $N" | tee -a $Log_file
    fi
}

dnf list installed mysql &>>$Log_file
    if [ $? -ne 0 ]; then
        dnf install mysql -y &>>$Log_file
        validate $? "MySql"
    else
        echo -e "Already Installed Mysql ... $Y Skipped $N" | tee -a $Log_file
    fi

dnf list installed nginx &>>$Log_file
    if [ $? -ne 0 ]; then
        dnf install nginx -y &>>$Log_file
        validate $? "Nginx"
    else
        echo -e "Already Installed Nginx ... $Y Skipped $N" | tee -a $Log_file
    fi

dnf list installed pyhon3 &>>$Log_file
    if [  $? -ne 0 ]; then
        dnf install python3 -y &>>$Log_file
        validate $? "Pyhon 3"
    else
        echo -e "Already Installed Pyhon 3 ... $Y Skipped $N" | tee -a $Log_file
    fi