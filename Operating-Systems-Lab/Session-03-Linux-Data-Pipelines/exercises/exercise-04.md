# Exercise 04 - Challenge 3: exact cut of lines 1000-1010

**Source:** Session 03 slides, slide 14, challenge 3 ("Exact cut")

## Objective

Given a large file `data.csv`, combine `head`, `tail` and a pipe so that **exactly lines 1000 to 1010** are printed.

## Solution

```bash
head -n 1010 data.csv | tail -n 11
```

## Explanation

- `head -n 1010` keeps lines 1 to 1010 and drops everything after.
- `tail -n 11` keeps the last 11 lines of that result, which are lines 1000 to 1010 (1010 - 1000 + 1 = 11 lines, both ends included).
- The pipe passes the first stage's output to the second without creating a temporary file, and `head` stops reading the big file after line 1010.

## Result

**Verified output** (included `data.csv`, where each row starts with its own line number; the header is line 1):

```text
$ head -n 1010 data.csv | tail -n 11
1000,item-1000,3000
1001,item-1001,3003
1002,item-1002,3006
1003,item-1003,3009
1004,item-1004,3012
1005,item-1005,3015
1006,item-1006,3018
1007,item-1007,3021
1008,item-1008,3024
1009,item-1009,3027
1010,item-1010,3030
```

Piping the result into `wc -l` printed `11`.
