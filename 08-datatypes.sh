#!bin/bash

NUM1=100
NUM2=150

SUM=$(($NUM1+$NUM2))

echo "sum is: $SUM"

#Array
FRUITS=("APPLE" "BANANA" "MANGO")

echo "Fruits are: ${FRUITS[@]}"
echo "First Fruit is: ${FRUITS[0]}"
echo "Second Fruit is: ${FRUITS[1]}"
echo "Third Fruit is: ${FRUITS[2]}"