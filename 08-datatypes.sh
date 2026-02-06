#!bin/bash

NUM1=100
NUM2=150

SUM=$(($NUM1+$NUM2))

echo "sum is: $SUM"

#Array
FRUITS=("APPLE" "BANANA" "MANGO")

echo "Fruits are: ${FRUITS[@]}"