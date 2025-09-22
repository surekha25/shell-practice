#!/bin/bash

#Date=$(date)

START_Time=$(date +%s)

sleep 15

END_Time=$(date +%s)

Total_Time=$(($END_Time-$START_Time))

echo "Script Executed in: $Total_Time seconds"