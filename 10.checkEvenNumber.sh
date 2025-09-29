#!/bin/bash

echo "Please Enter Number :"
read number

if [ $(($number % 2 )) -eq 0 ]; then
    echo "Given Number $number is Even"
else
    echo "Given Number $number is Odd"
fi