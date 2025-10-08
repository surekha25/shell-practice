#!/bin/bash

count=5

echo "Starting Countdown ..."

while [ $count -gt 0 ]
do
    echo "Time left: $count"
    sleep 1 #pause for 1 second
    count=$((count -1)) # Decrement the count
done

echo "Times Up!"