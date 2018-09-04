#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Usage: ./error_handling <greetee>"
    exit 1
elif [ $# -eq 1 ]
then
    echo "Hello, $1"
else
    exit 1
fi
