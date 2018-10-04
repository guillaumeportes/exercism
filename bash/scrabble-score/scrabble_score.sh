#!/bin/bash

[[ $# = 0 ]] && { echo "you need to provide a word" >&2; exit 1; }
[[ $# -gt 1 ]] && { echo "you need to provide only one argument" >&2; exit 1; }
regex="[a-zA-Z]*"
[[ "$1" =~ $regex ]] || { echo "you need to provide a word" >&2; exit 1; }

result=0

for (( i=0; i < ${#1}; i++ ))
do
    case ${1:$i:1} in
        a|A|e|e|i|I|o|O|u|U|l|L|n|N|r|R|s|S|t|T) (( result+=1 )) ;;
        d|D|g|G) (( result += 2 )) ;;
        b|B|c|C|m|M|p|P) (( result += 3 )) ;;
        f|F|h|H|v|V|w|W|y|Y) (( result += 4 )) ;;
        k|K) (( result += 5 )) ;;
        j|J|x|X) (( result += 8 )) ;;
        q|Q|z|Z) (( result += 10 )) ;;
    esac
done

echo $result

