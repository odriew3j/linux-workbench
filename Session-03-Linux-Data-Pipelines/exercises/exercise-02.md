# Exercise 02 - Challenge 1: browse the manual (`man grep`)

**Source:** Session 03 slides, slide 14, challenge 1 ("Digging in the manual")

## Objective

By reading `man grep`, find the option that does the job of `grep | wc -l` on its own, i.e. prints only the **number of matches**.

## Solution

```bash
man grep        # type /count and press Enter to search; press q to quit
```

**The option is `-c` (`--count`).**

```bash
grep -c "error" system.log          # instead of: grep "error" system.log | wc -l
grep -ic "error" system.log         # combine with -i for case-insensitive counting
```

## Explanation

`-c` makes `grep` print the number of selected **lines** instead of the lines themselves. It counts matching lines, not individual occurrences, so a line containing "error" twice still counts once, exactly like `wc -l` on the filtered output. With several input files, `grep -c` prints one count per file.

## Result

**Verified output:**

```text
$ grep --help | grep -- '-c, --count'
  -c, --count               print only a count of selected lines per FILE
$ tail -n 1000 system.log | grep -ic "error"
220
```

The count is identical to the three-command pipeline of Exercise 01 (220 on the sample data).
