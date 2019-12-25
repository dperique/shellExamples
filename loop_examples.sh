#!/bin/bash

# Examples of the 3 types of loops using the double parentheses
# instead of the square brackets.  Doing it this way makes it look
# very C-like.
#
((t = 3))
until ((t <= 0)); do
    echo "I think $t is the number"
    ((t--))
done

((t = 0))
while ((t < 10)); do
    echo $t
    ((t++))
done

for ((i = 1 ; $i < 10; i++)); do
    echo $i
done
