#!/bin/bash

if ! [ $# -eq 1 ] || ! [[ "$1" =~ ^[0-9]+$ ]]
then
    echo "Usage: leap.sh <year>"
    exit 1
else
    if [[ $(($1 % 400)) = 0 ]]
    then
        echo "true"
    elif [[ $(($1 % 100)) = 0 ]]
    then
        echo "false"
    elif [[ $(($1 % 4)) = 0 ]]
    then
        echo "true"
    else
        echo "false"
    fi
fi

