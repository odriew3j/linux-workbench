#!/usr/bin/env bash
# Session 06 - Exercise 01: Age calculator ("Time travel")
# Asks for a name and the current age, then tells the user how many years
# remain until they turn 50.
#
# Usage: ./exercise-01.sh

read -rp "Enter your name: " name
read -rp "Enter your current age: " age

# The age must be a whole number, otherwise $(( )) would fail or misbehave.
if ! echo "$age" | grep -Eq '^[0-9]+$'; then
    echo "Error: age must be a non-negative whole number." >&2
    exit 1
fi

# Arithmetic with the modern $(( )) syntax.
remaining=$((50 - age))

if [ "$remaining" -gt 0 ]; then
    echo "Hello $name, you will be 50 years old in $remaining years."
elif [ "$remaining" -eq 0 ]; then
    echo "Hello $name, you are 50 years old right now."
else
    echo "Hello $name, you already turned 50 $((age - 50)) years ago."
fi
