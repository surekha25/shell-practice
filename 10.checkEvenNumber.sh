#!/bin/bash

echo "Please Enter Number :"
read $number

if [ $(($number % 2 )) -eq 0 ]; then
    echo "Number $number is Even"
else
    echo "Number $number is Odd"
fi