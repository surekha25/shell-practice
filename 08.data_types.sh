#!/bin/bash

number1=100
number2=200
name=surekha

sum=$(($number1+$number2+$name))

echo "sum is ${sum}"

#array

# size=4 max index=3
leaders=("modi" "putin" "trudo" "trump")

echo "All leaders: ${leaders[@]}"

echo "First Leader: ${leaders[0]}"
echo "Second Leader: ${leaders[1]}"
echo "Third Leader: ${leaders[2]}"
echo "Fourth Leader: ${leaders[3]}"