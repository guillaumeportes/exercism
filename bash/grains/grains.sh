#!/bin/bash

set -o errexit
set -o nounset

# 2^63 is too large to use bash arithmetics so we use bc
square()
{
    ( (($1 < 1)) || (($1 > 64)) ) && echo "Error: invalid input" && exit 1
    printf "%u\\n" $((2**($1-1)))
}

# First implementation was using the above square function, which was very slow.
# For performance we actually send the whole operation as a string to bc
total()
{
    result=0
    for i in $(seq 1 64);
    do
        result=$((result + $(square i)))
    done
    printf "%u\\n" "$result"
}

if [ "$1" = "total" ]
then
    total "$@"
else
    square "$@"
fi
