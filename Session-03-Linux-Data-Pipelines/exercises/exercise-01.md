# Exercise 01 - Practical scenario: server front-line challenge

**Source:** Session 03 slides, slide 13 ("Practical scenario: server front-line challenge")

## Objective

You are the server administrator. Find the exact number of errors (`error`) that occurred in the **last 1000 lines** of the system log.

## Solution

Three steps, then the combined pipeline:

| Step | Task | Command |
|------|------|---------|
| 1 | Extract the last 1000 lines | `tail -n 1000 system.log` |
| 2 | Filter the word "error" | `grep -i "error"` |
| 3 | Count the lines | `wc -l` |

```bash
tail -n 1000 system.log | grep -i "error" | wc -l
```

## Explanation

- `tail -n 1000` writes only the last 1000 lines to stdout.
- The pipe `|` connects that stdout to the stdin of `grep`.
- `grep -i "error"` keeps the lines containing "error" in any letter case (`ERROR`, `Error`, `error`).
- The second pipe feeds those lines to `wc -l`, which prints how many lines arrived. Nothing is printed on screen between the stages.

## Result

**Verified output** (run in `data/` with the included sample `system.log`, which has 220 matching lines among the last 1000):

```text
$ tail -n 1000 system.log | grep -i "error" | wc -l
220
```

The sample has 200 lines with the level `ERROR` and 20 `INFO` lines containing the lowercase word "error". A case-sensitive `grep "ERROR"` counts only the first 200, which shows why `-i` matters. The number on the slide (142) belongs to the professor's own log file and cannot be reproduced with this data.
