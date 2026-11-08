# Exercise 01 - Class exercise: age calculator ("Time travel")

**Source:** Session 06 slides, slide 11

## Objective

Write a script that asks for the user's name and age and calculates **in how many years the user will be 50**.

**Script:** [../scripts/exercise-01.sh](../scripts/exercise-01.sh)

## Solution

```bash
./exercise-01.sh
```

The script reads `name` and `age` with `read -rp`, validates that the age is a whole number, computes `remaining=$((50 - age))` and prints the matching message.

## Explanation

- `read -rp "prompt" variable` prints the prompt and stores the answer in one line (`-r` keeps backslashes literal).
- `$(( ... ))` is the modern arithmetic syntax; in Bash `A=50-30` would store the text `50-30`, not a number.
- A small `if / elif / else` handles users who are already 50 or older.
- The age is validated with `grep -Eq '^[0-9]+$'`, otherwise `$(( ))` would fail with an unhelpful message.

## Differences from the slide's code

The code shown on the slide does not work as printed, so it was corrected instead of copied:

| Slide | Problem | Fix |
|-------|---------|-----|
| `read NAME="Enter your name: "` | The prompt is not valid `read` syntax | `read -rp "Enter your name: " name` |
| `echo REMAINING=$((AGE - 50))` | `echo` only prints the text; the variable is never set | `remaining=$((50 - age))` |
| `AGE - 50` | The sign is reversed: a 20-year-old would get -30 | `50 - age` |

## Result

**Verified output** (input supplied through a pipe, so prompts are not shown):

```text
$ printf 'Sara\n20\n' | ./exercise-01.sh
Hello Sara, you will be 50 years old in 30 years.
$ printf 'Sara\n50\n' | ./exercise-01.sh
Hello Sara, you are 50 years old right now.
$ printf 'Sara\n57\n' | ./exercise-01.sh
Hello Sara, you already turned 50 7 years ago.
$ printf 'Sara\nabc\n' | ./exercise-01.sh
Error: age must be a non-negative whole number.       (exit status 1, printed to stderr)
```
