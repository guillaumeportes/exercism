#!/bin/bash

[[ $# = 0 ]] && { echo "you need to provide a number" >&2; exit 1; }
[[ $# -gt 1 ]] && { echo "you need to provide only one argument" >&2; exit 1; }
regex="[0-9]+"
[[ "$1" =~ $regex ]] || { echo "you need to provide a number" >&2; exit 1; }

result=""
if [[ $(($1 % 3)) = 0 ]]
then
    result+="Pling"
fi

if [[ $(($1 % 5)) = 0 ]]
then
    result+="Plang"
fi

if [[ $(($1 % 7)) = 0 ]]
then
    result+="Plong"
fi

[[ ${#result} = 0 ]] && { echo "$1"; exit 0; }

echo "$result"
