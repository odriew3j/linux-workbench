# Session 01 - Mastering the Linux Command Line

Introduction to Linux and the command-line interface (CLI): OS layers (hardware, kernel, shell, GUI), the filesystem hierarchy, absolute vs. relative paths, and the basic navigation tools `pwd`, `cd`, `ls`, `whoami`, `man`.

Source: `1__Mastering_the_Linux_Command_Line.pdf`

## Exercises

| # | Exercise | Original reference | Solution |
|---|----------|--------------------|----------|
| 01 | Practical scenario: discover who owns the password file | Slide 14 | [exercise-01.md](exercises/exercise-01.md) |
| 02 | Advanced search: sort files by size with `ls` | Slide 15, homework 1 | [exercise-02.md](exercises/exercise-02.md) |
| 03 | Architecture research: `/bin` vs `/sbin` | Slide 15, homework 2 | [exercise-03.md](exercises/exercise-03.md) |
| 04 | Draw the parent-child map of the 5 main directories | Slide 15, homework 3 | [exercise-04.md](exercises/exercise-04.md) |

This session has no Bash scripts: every exercise is a terminal or theory task.

## Requirements

Any Linux system with a Bash shell. No `sudo` is needed.

## Notes

- Home directory, user name and dates in the example output depend on the machine where the commands are run. The verified outputs below come from a sandbox where the user was `root` (home `/root`), so your prompt will show your own user name instead.
