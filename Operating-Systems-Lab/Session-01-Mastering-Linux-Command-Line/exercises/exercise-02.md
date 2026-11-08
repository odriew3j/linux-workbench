# Exercise 02 - Advanced search: sort files by size

**Source:** Session 01 slides, slide 15, homework 1 ("Advanced search")

## Objective

Using `man ls`, find the option that sorts files by size.

## Solution

```bash
man ls          # then type /size and press Enter to search; press q to quit
ls -lS          # long listing, largest file first
ls -lSh         # same, with human-readable sizes (KB, MB)
ls -lSr         # same as -lS but reversed (smallest first)
```

**The option is `-S`.**

## Explanation

The manual describes `-S` as "sort by file size, largest first". It only changes the order, so it is normally combined with `-l` to make the sizes visible. `-r` reverses any sort order and `-h` makes sizes readable.

## Result

**Verified output** (text from `ls --help`, which matches the `man ls` entry):

```text
  -S                         sort by file size, largest first
```

**Verified output** (test directory with three files of 3000, 500 and 10 bytes):

```text
$ ls -lS
-rw-r--r-- 1 root root 3000 Nov  8 07:52 big
-rw-r--r-- 1 root root  500 Nov  8 07:52 medium
-rw-r--r-- 1 root root   10 Nov  8 07:52 small
```
