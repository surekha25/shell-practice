#!/bin/bash

userid=$(id -u)

source_dir=$1
dest_dir=$2
days=${3:-14} # if user $3 (arg no 3) not provided considered as 14 days

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
log_file="$log_folder/backup.log"

mkdir -p $log_folder
echo "Script Started and Executed at: $(date)" | tee -a $log_file

USAGE(){    
    echo "USAGE: sudo sh 24.backup.sh source_dir dest_dir days[optional - by default days will take 14] "
    exit 1
}

### Check SOURCE_DIR and DEST_DIR passed or not ####
if [ $# -lt 2 ]; then
    USAGE
fi

### Check SOURCE_DIR Exist ####
if [ ! -d $source_dir ]; then 
    echo "Source $source_dir doesn't exit.."
fi

### Check DEST_DIR Exist ####
if [ ! -d $dest_dir ]; then
    echo "Destination $dest_dir doesn't exit.."
fi

### Find the files ####
files=$(find $source_dir -name "*.log" -type f -mtime +$days)


### check {$files} empty or not ####
if [ ! -z "${files}" ]; then
    ### Start Archeiving ###
    echo "Found Files : $files"
    timestamp=$(date +%F-%H-%M)
    zip_file_name="$dest_dir/app-logs/$timestamp.zip"
    echo "Zip File Name is: $zip_file_name"
    find $source_dir -name "*.log" -type f -mtime +$days | zip -@ -j "$zip_file_name"

    ### check files archieval success or not

    if [ -f $zip_file_name ]; then
        echo -e "Archieval ... $G Success $N"
        
        ### Deleting the files from source dir 
        while IFS= read -r filepath
        do
            echo "Deleting the file... $filepath"
            rm -rf $filepath
            echo "Deleted ....$filepath"
        done <<< $files

    else
        echo -e "Archieval ... $R Failure $N"
        exit 1
    fi
else
    echo -e "Files doesn't exist ... $Y Skipping $N"
fi
