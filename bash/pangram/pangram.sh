#!/usr/bin/env bash

#convert all positional arguments into one lower case string
input="${*,,}"
for i in {a..z}
do
    [[ "$input" =~ $i ]] || { echo "false"; exit 0; }
done

echo "true"
