#!/usr/bin/env bash

[[ ${#@} -eq 2 ]] || { echo "Usage: difference_of_square {square_of_sum, sum_of_squares, difference} number" >&2; exit 1; }
[[ "$1" = "square_of_sum" || "$1" = "sum_of_squares" || "$1" = "difference" ]] || { echo "Usage: difference_of_square {square_of_sum, sum_of_squares, difference} number" >&2; exit 1; }
regex='^[0-9]+$'
[[ "$2" =~ $regex ]] || { echo "Usage: difference_of_square {square_of_sum, sum_of_squares, difference} number" >&2; exit 1; }

i=1
sum_of_squares=0
square_of_sum=0

while (( i <= "$2" ))
do
    (( sum_of_squares += i**2 ))
    (( square_of_sum += i ))
    (( i++ ))
done

(( square_of_sum = square_of_sum ** 2 ))

case "$1" in
    "square_of_sum") echo "$square_of_sum" ;;
    "sum_of_squares") echo "$sum_of_squares" ;;
    "difference") echo $(( square_of_sum - sum_of_squares )) ;;
esac
