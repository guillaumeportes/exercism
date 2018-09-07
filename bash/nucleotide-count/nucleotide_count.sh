#!/bin/bash

A=0
C=0
T=0
G=0

if [ $# = 1 ]
then
    invalid=$(echo "$1" | sed "s/[ACTG]//g")
    if [ ${#invalid} -eq 0 ]
    then
        for x in $(echo ACTG | fold -w 1)
        do
            count="$(echo "$1" | sed "s/[^$x]//g")"
            eval "$x"=${#count}
        done
    else
        echo "Invalid nucleotide in strand"
        exit 1
    fi
fi

printf "A: %u\\nC: %u\\nG: %u\\nT: %u\\n" "$A" "$C" "$G" "$T"

