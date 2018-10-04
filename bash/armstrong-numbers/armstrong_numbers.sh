#!/usr/bin/env bash

[[ ${#@} = 1 ]] || { echo "Error: Only positive numbers are allowed" >&2; exit 1; }
regex='^[0-9]+$'
[[ "$1" =~ $regex ]] || { echo "Error: Only positive numbers are allowed" >&2; exit 1; }
[[ "$1" -gt 0 ]] || { echo "Error: Only positive numbers are allowed" >&2; exit 1; }

result=0

for (( i=0; i<${#1}; i++ ))
do
    result=$(( result + ${1:i:1}**${#1} ))
done

if [[ "$result" -eq "$1" ]]
then
    echo "true"
else
    echo "false"
fi

