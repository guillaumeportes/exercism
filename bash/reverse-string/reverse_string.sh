#!/bin/bash

result=""
for ((i=1; i <= ${#1}; i++))
do
    result+=${1:(-$i):1}
done
echo $result
