# Exercise 04 - Challenge 3: library search (`man rm`)

**Source:** Session 02 slides, slide 14, challenge 3

## Objective

Using `man rm` in the terminal, find the switch used for **forced deletion without confirmation**.

## Solution

```bash
man rm      # type /force and press Enter to search; press q to quit
```

**The switch is `-f` (`--force`).**

```bash
rm -f old_file.txt      # no prompt, and no error if the file does not exist
```

## Explanation

The manual describes `-f, --force` as "ignore nonexistent files and arguments, never prompt". It is the opposite of `-i`, which asks before every removal. Because Linux has no recycle bin, `rm -f` (especially `rm -rf` on a directory) removes data permanently and silently, so use it with care.

## Result

**Verified output** (text from `rm --help`, which matches the `man rm` entry):

```text
  -f, --force           ignore nonexistent files and arguments, never prompt
  -i                    prompt before every removal
```
