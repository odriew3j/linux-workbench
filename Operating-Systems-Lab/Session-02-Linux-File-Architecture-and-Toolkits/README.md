# Session 02 - Linux File Architecture and Toolkits

Filesystem management, editors and compression on the command line: the "everything is a file" idea and inodes, `mkdir`/`touch`/`cp`/`mv`/`rm`, hard vs. soft links (`ln`), `cat`, CLI editors (Vim modes and saving), and `tar` + `gzip`.

Source: `2__Linux_File_Architecture_and_Toolkits.pdf`

## Exercises

| # | Exercise | Original reference | Solution |
|---|----------|--------------------|----------|
| 01 | Practical scenario: build the `lab2` project structure | Slide 13 | [exercise-01.md](exercises/exercise-01.md) |
| 02 | Challenge 1 - one-line architect (`mkdir`) | Slide 14, challenge 1 | [exercise-02.md](exercises/exercise-02.md) |
| 03 | Challenge 2 - links lab (hard link, soft link, `rm`) | Slide 14, challenge 2 | [exercise-03.md](exercises/exercise-03.md) |
| 04 | Challenge 3 - library search (`man rm`) | Slide 14, challenge 3 | [exercise-04.md](exercises/exercise-04.md) |

This session has no Bash scripts: every exercise is performed directly in the terminal.

## Requirements

Linux with Bash, `vim`, `tar` and `gzip`. No `sudo` is needed. Do the exercises in a scratch directory (for example `mkdir ~/os-lab && cd ~/os-lab`) because they create and delete files.

## Notes

- Exercise 02 uses Bash brace expansion; run it in Bash (not plain `sh`).
- The verified outputs were produced in an isolated sandbox, with inode numbers and dates that will differ on your machine.
