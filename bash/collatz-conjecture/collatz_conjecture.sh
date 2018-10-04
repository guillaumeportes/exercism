#!/usr/bin/env bash

[[ ${#@} = 1 ]] || { echo "Error: Only positive numbers are allowed" >&2; exit 1; }
regex='^[0-9]+$'
[[ "$1" =~ $regex ]] || { echo "Error: Only positive numbers are allowed" >&2; exit 1; }
[[ $1 -gt 0 ]] || { echo "Error: Only positive numbers are allowed" >&2; exit 1; }

result=0
n=$1

while (( n > 1 ))
do
    if [[ $((n % 2)) = 0 ]]
    then
        n=$((n/2))
    else
        n=$((n*3+1))
    fi
    result=$((result+1))
done

echo $result
