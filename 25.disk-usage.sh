#!/bin/bash

disk_usage=$(df -hT | grep -v Filesystem)

while IFS= read -r line
do
    echo "line: $line"
done <<< $disk_usage