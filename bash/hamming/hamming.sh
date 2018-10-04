#!/usr/bin/env bash

[[ ${#@} = 2 ]] || { echo "Usage: hamming.sh <strand1> <strand2>" >&2; exit 1; }
regexp='^[ACTG]*$'
[[ "$1" =~ $regexp && "$2" =~ $regexp ]] || { echo "Strands can only contain ACTG" >&2; exit 1; }
[[ ${#1} = ${#2} ]] || { echo "left and right strands must be of equal length" >&2; exit 1; }

result=0
for (( i=0; i<${#1}; i++ ))
do
    if [[ ${1:i:1} != ${2:i:1} ]]
    then
        result=$(( result + 1 ))
    fi
done

echo "$result"
