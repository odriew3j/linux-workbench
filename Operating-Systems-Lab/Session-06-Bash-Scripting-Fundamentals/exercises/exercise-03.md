# Exercise 03 - Homework challenge 1: geometry in the terminal

**Source:** Session 06 slides, slide 13, challenge 1 ("Geometry in the terminal")

## Objective

Write a script that reads the **length and width** of a rectangle with `read -p`, then calculates and prints its **area and perimeter** using the modern `$(( ))` syntax.

**Script:** [../scripts/exercise-03.sh](../scripts/exercise-03.sh)

## Solution

```bash
./exercise-03.sh
```

The core of the script:

```bash
read -rp "Enter the length: " length
read -rp "Enter the width: " width
area=$((length * width))
perimeter=$((2 * (length + width)))
```

## Explanation

- Inside `$(( ))`, variables need no `$` and `*` needs no backslash (unlike `expr`).
- Area = length x width; perimeter = 2 x (length + width).
- Bash arithmetic is integer-only, so the script accepts whole numbers and rejects anything else with an error message and exit status 1. Decimal values would need an external tool such as `bc`, which has not been covered.

## Result

**Verified output** (input supplied through a pipe, so prompts are not shown):

```text
$ printf '8\n5\n' | ./exercise-03.sh
Area:      40
Perimeter: 26
$ printf '8\nx\n' | ./exercise-03.sh
Error: 'x' is not a valid whole number.        (exit status 1, printed to stderr)
```
