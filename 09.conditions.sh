#!/bin/bash

number=$1;

echo "Please Enter Number :"
read $number

if[$number -gt 10]; then
    echo "The Number $number is greather than 10"
else 
    echo "The Number $number is less than 10"
fi