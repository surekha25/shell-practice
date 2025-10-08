#!/bin/bash

count=5

echo "Starting Countdown ...."

while [ $count -gt 0 ]; then
do
    echo "Time Left: $count"
    sleep 1
    count=$(( count - 1 ))
done

echo "Times Up...!"