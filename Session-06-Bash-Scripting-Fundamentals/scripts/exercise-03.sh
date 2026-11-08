#!/usr/bin/env bash
# Session 06 - Homework Challenge 1: "Geometry in the terminal"
# Reads the length and width of a rectangle with read -p and prints its
# area and perimeter, computed with the modern $(( )) syntax.
# Bash arithmetic is integer-only, so whole numbers are required.
#
# Usage: ./exercise-03.sh

read -rp "Enter the length: " length
read -rp "Enter the width: " width

for value in "$length" "$width"; do
    if ! echo "$value" | grep -Eq '^[0-9]+$'; then
        echo "Error: '$value' is not a valid whole number." >&2
        exit 1
    fi
done

area=$((length * width))
perimeter=$((2 * (length + width)))

echo "Area:      $area"
echo "Perimeter: $perimeter"
