#!/usr/bin/env bash

error="Usage: triangle.sh {equilateral, isosceles, scalene, degenerate} a b c where a, b and c are numbers"
# need 3 arguments
[[ ${#@} -eq 4 ]] || { echo "$error" >&2; exit 1; }

[[ "$1" = "isosceles" || "$1" = "equilateral" || "$1" = "scalene" || "$1" = "degenerate" ]] || { echo "$error" >&2; exit 1; }

# need 3 numbers
regex='^[0-9]+(\.[0-9]+)?$'
[[ "$2" =~ $regex && "$3" =~ $regex && "$4" =~ $regex ]] || { echo "$error" >&2; exit 1; }

# need a triangle
[[ $(echo "$2 + $3 >= $4 && $2 + $4 >= $3 && $3 + $4 >= $2 && $2 > 0 && $3 > 0 && $4 > 0" | bc) -eq 1 ]] || { echo "false"; exit 0; }

result="false"

case "$1" in
    "equilateral") [[ $(echo "$2 == $3 && $2 == $4 && $3 == $4" | bc) -eq 1 ]] && result="true" ;;
    "isosceles") [[ $(echo "$2 == $3|| $2 == $4 || $3 == $4" | bc) -eq 1 ]] && result="true" ;;
    "scalene") [[ $(echo "$2 != $3 && $2 != $4 && $3 != $4" | bc) -eq 1 ]] && result="true" ;;
    "degenerate") [[ $(echo "$2 + $3 == $4 || $2 + $4 == $3 || $3 + $4 == $2" | bc) -eq 1 ]] && result="true" ;;
esac

echo $result

