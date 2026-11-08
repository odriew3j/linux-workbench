#!/usr/bin/env bash
# Session 06 - Homework Challenge 2: user existence check
# (called check_user.sh in the slides - rename the file if required)
# Takes a username as the first command-line argument ($1) and checks
# /etc/passwd to see whether that user exists on this Linux system.
#
# Usage:        ./exercise-04.sh <username>
# Exit status:  0 = user exists, 1 = user not found, 2 = wrong usage

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <username>" >&2
    exit 2
fi

username="$1"

# Field 1 of /etc/passwd is the username. -x matches the whole line and -F
# treats the name literally, so "ali" does not match "alice" and special
# characters in the name are not interpreted as regex.
if cut -d ':' -f 1 /etc/passwd | grep -qxF -- "$username"; then
    echo "User '$username' exists on this system."
else
    echo "User '$username' does not exist on this system."
    exit 1
fi
