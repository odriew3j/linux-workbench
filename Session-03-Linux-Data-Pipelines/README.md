# Session 03 - Linux Data Pipelines

Standard streams (stdin, stdout, stderr), redirection (`>`, `>>`, `<`, `2>`), pipes (`|`), wildcards vs. regular expressions, and the text-processing tools `cat`, `less`, `head`, `tail`, `grep`, `cut`, `wc`, `find`, `which`, `whereis`.

Source: `3__Linux_Data_Pipelines.pdf`

## Exercises

| # | Exercise | Original reference | Solution |
|---|----------|--------------------|----------|
| 01 | Practical scenario: count errors in the last 1000 log lines | Slide 13 | [exercise-01.md](exercises/exercise-01.md) |
| 02 | Challenge 1 - browse the manual (`man grep`) | Slide 14, challenge 1 | [exercise-02.md](exercises/exercise-02.md) |
| 03 | Challenge 2 - deep search for `.conf` files in `/etc` | Slide 14, challenge 2 | [exercise-03.md](exercises/exercise-03.md) |
| 04 | Challenge 3 - exact cut: lines 1000-1010 of `data.csv` | Slide 14, challenge 3 | [exercise-04.md](exercises/exercise-04.md) |

All four are terminal exercises, so the solutions are Markdown only.

## Sample data

The slides refer to a log file `system.log` and a large file `data.csv` without providing them. Small deterministic stand-ins are included so that every command can be reproduced:

| File | Content |
|------|---------|
| [data/system.log](data/system.log) | 1500 log lines (`INFO`, `WARNING`, `ERROR`) |
| [data/data.csv](data/data.csv) | header + 1999 rows; each row starts with its own line number |

They are produced by the helper script [scripts/generate-sample-data.sh](scripts/generate-sample-data.sh), which is **not** an exercise. To regenerate them:

```bash
cd Session-03-Linux-Data-Pipelines/scripts
./generate-sample-data.sh        # writes ../data/system.log and ../data/data.csv
```

Run the exercise commands from the `data/` directory.

## Requirements

Linux with Bash and the standard GNU utilities (`tail`, `head`, `grep`, `wc`, `find`). No `sudo` is needed.
