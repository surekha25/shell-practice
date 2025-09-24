#!/bin/bash

number1=100
number2=200
name=surekha

sum=$(($number1+$number2+$name))

echo "sum is ${sum}"

#array

leaders=("modi" "putin" "trudo" "trump")

echo "All leaders: ${leaders}[@]"