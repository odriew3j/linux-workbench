# Session 06 - Bash Scripting Fundamentals

Introduction to Bash scripting: script anatomy (shebang, comments, commands), making a script executable (`chmod +x`, run with `./`), variables and quoting, system variables (`$USER`, `$HOME`, `$PATH`), user input with `read -p`, integer arithmetic with `$(( ))`, command-line arguments (`$0`, `$1`, `$#`, `$@`), and `if`/`else` with file tests.

Source: `6__Bash_Scripting_Fundamentals.pdf`

## Exercises

Every exercise is a script with a short write-up.

| # | Exercise | Original reference | Script | Write-up |
|---|----------|--------------------|--------|----------|
| 01 | Class exercise: age calculator | Slide 11 | [exercise-01.sh](scripts/exercise-01.sh) | [exercise-01.md](exercises/exercise-01.md) |
| 02 | Final project: system health check | Slide 12 | [exercise-02.sh](scripts/exercise-02.sh) | [exercise-02.md](exercises/exercise-02.md) |
| 03 | Homework challenge 1: geometry in the terminal | Slide 13, challenge 1 | [exercise-03.sh](scripts/exercise-03.sh) | [exercise-03.md](exercises/exercise-03.md) |
| 04 | Homework challenge 2: user existence check (`check_user.sh`) | Slide 13, challenge 2 | [exercise-04.sh](scripts/exercise-04.sh) | [exercise-04.md](exercises/exercise-04.md) |

## Running the scripts

```bash
cd Session-06-Bash-Scripting-Fundamentals/scripts
chmod +x *.sh                 # only needed if the execute bit was lost (e.g. after unzipping)

./exercise-01.sh              # prompts for name and age
./exercise-02.sh              # prints the health report
./exercise-03.sh              # prompts for length and width
./exercise-04.sh root         # checks whether the user "root" exists
```

## Requirements

Bash 4+ and standard GNU utilities (`grep`, `cut`, `awk`, `free`). `free` comes from the `procps` package, so Exercise 02 is Linux-only. No `sudo` is needed.

## Notes

- Syntax of all scripts was checked with `bash -n`.
- `read -p` prints its prompt only when input comes from a terminal. When testing with piped input (`printf 'Sara\n20\n' | ./exercise-01.sh`), the prompts are not shown.
