# Operating Systems Laboratory

Solutions and practical work for the **Operating Systems Laboratory** university course (Linux command line, filesystem, pipelines, permissions, processes and Bash scripting).

Each lab session lives in its own folder. The repository grows during the semester: new sessions are added next to the existing ones without changing them.

## Sessions

| Session | Topics | Folder |
|---------|--------|--------|
| 01 | Linux basics, filesystem hierarchy, paths, `pwd`/`cd`/`ls`/`man` | [Session-01-Mastering-Linux-Command-Line](Session-01-Mastering-Linux-Command-Line/) |
| 02 | Everything is a file, inodes, `mkdir`/`cp`/`mv`/`rm`, links, Vim, `tar`/`gzip` | [Session-02-Linux-File-Architecture-and-Toolkits](Session-02-Linux-File-Architecture-and-Toolkits/) |
| 03 | Standard streams, redirection, pipes, `grep`/`head`/`tail`/`wc`/`find` | [Session-03-Linux-Data-Pipelines](Session-03-Linux-Data-Pipelines/) |
| 04 | Users and groups, `rwx` and octal permissions, `chmod`/`chown`/`chgrp`, `umask` | [Session-04-Linux-Permissions-and-User-Management](Session-04-Linux-Permissions-and-User-Management/) |
| 05 | Processes, job control, signals, `kill`, `cron`/`at` | [Session-05-Linux-Command-Center](Session-05-Linux-Command-Center/) |
| 06 | Bash scripting: variables, `read`, arithmetic, arguments, `if`/`else` | [Session-06-Bash-Scripting-Fundamentals](Session-06-Bash-Scripting-Fundamentals/) |

## How to navigate

1. Open a session folder and read its `README.md`: it lists the exercises with their source slide and links to the solutions.
2. `exercises/exercise-NN.md` holds the write-up of exercise NN (objective, solution, explanation, result).
3. `scripts/exercise-NN.sh` holds the Bash script for exercises that are scripting tasks. Run instructions are in the session README.
4. Exercise numbers follow the order in the slides: the practical scenario first, then the homework or challenge items in their original order.

## Conventions

```text
Session-NN-<Title>/
├── README.md              session overview and exercise list
├── exercises/             exercise-NN.md write-ups
├── scripts/               exercise-NN.sh (only when needed)
└── data/                  sample input files (only when needed)
```

- Exercises that are performed in the terminal or are theory questions are documented in Markdown only; Bash scripts are written only for scripting tasks.
- **Verified** output was produced by actually running the commands in an isolated Linux sandbox (Bash 5.2, user `root`, so paths such as `/root` and the owner `root` appear in places). **Simulated** and **Not verified** labels mark everything else. No output is invented.
- Source of truth for every exercise: the instructor's slide decks. Where a slide is ambiguous or contains an error, the session write-up says so and states the interpretation used.

## Exercise tracking

Verification column: **Yes** = run and checked in the sandbox, **Partial** = part could not be run (reason in the write-up), **N/A** = diagram or theory only.

| Session | Exercise | Source | File | Type | Status | Verification |
|---------|----------|--------|------|------|--------|--------------|
| 01 | Exercise 01 - discover password-file owner | Slide 14 | [exercise-01.md](Session-01-Mastering-Linux-Command-Line/exercises/exercise-01.md) | Markdown | Completed | Yes |
| 01 | Exercise 02 - sort files by size | Slide 15, HW 1 | [exercise-02.md](Session-01-Mastering-Linux-Command-Line/exercises/exercise-02.md) | Markdown | Completed | Yes |
| 01 | Exercise 03 - `/bin` vs `/sbin` | Slide 15, HW 2 | [exercise-03.md](Session-01-Mastering-Linux-Command-Line/exercises/exercise-03.md) | Markdown | Completed | Yes |
| 01 | Exercise 04 - directory tree map | Slide 15, HW 3 | [exercise-04.md](Session-01-Mastering-Linux-Command-Line/exercises/exercise-04.md) | Markdown | Completed | N/A |
| 02 | Exercise 01 - `lab2` project structure | Slide 13 | [exercise-01.md](Session-02-Linux-File-Architecture-and-Toolkits/exercises/exercise-01.md) | Markdown | Completed | Partial (Vim step is manual) |
| 02 | Exercise 02 - one-line `mkdir` | Slide 14, ch. 1 | [exercise-02.md](Session-02-Linux-File-Architecture-and-Toolkits/exercises/exercise-02.md) | Markdown | Completed | Yes |
| 02 | Exercise 03 - links lab | Slide 14, ch. 2 | [exercise-03.md](Session-02-Linux-File-Architecture-and-Toolkits/exercises/exercise-03.md) | Markdown | Completed | Yes |
| 02 | Exercise 04 - `man rm` force switch | Slide 14, ch. 3 | [exercise-04.md](Session-02-Linux-File-Architecture-and-Toolkits/exercises/exercise-04.md) | Markdown | Completed | Yes |
| 03 | Exercise 01 - count errors in last 1000 lines | Slide 13 | [exercise-01.md](Session-03-Linux-Data-Pipelines/exercises/exercise-01.md) | Markdown | Completed | Yes (sample data) |
| 03 | Exercise 02 - `man grep` count option | Slide 14, ch. 1 | [exercise-02.md](Session-03-Linux-Data-Pipelines/exercises/exercise-02.md) | Markdown | Completed | Yes |
| 03 | Exercise 03 - find `.conf` files in `/etc` | Slide 14, ch. 2 | [exercise-03.md](Session-03-Linux-Data-Pipelines/exercises/exercise-03.md) | Markdown | Completed | Yes |
| 03 | Exercise 04 - lines 1000-1010 of `data.csv` | Slide 14, ch. 3 | [exercise-04.md](Session-03-Linux-Data-Pipelines/exercises/exercise-04.md) | Markdown | Completed | Yes (sample data) |
| 04 | Exercise 01 - shared directory for developers | Slide 11 | [exercise-01.md](Session-04-Linux-Permissions-and-User-Management/exercises/exercise-01.md) | Markdown | Completed | Partial (`groupadd` not run) |
| 04 | Exercise 02 - remove group execute bit | Slide 12 | [exercise-02.md](Session-04-Linux-Permissions-and-User-Management/exercises/exercise-02.md) | Markdown | Completed | Yes |
| 04 | Exercise 03 - `umask 027` on a directory | Slide 12 | [exercise-03.md](Session-04-Linux-Permissions-and-User-Management/exercises/exercise-03.md) | Markdown | Completed | Yes |
| 05 | Exercise 01 - hunter of heavy processes | Slide 11 | [exercise-01.md](Session-05-Linux-Command-Center/exercises/exercise-01.md) | Markdown | Completed | Partial (SIGTSTP, cron not verified) |
| 05 | Exercise 02 - zombie process | Slide 12, ch. 1 | [exercise-02.md](Session-05-Linux-Command-Center/exercises/exercise-02.md) | Markdown | Completed | Partial (reaping not observed) |
| 05 | Exercise 03 - `dmesg` pipeline analysis | Slide 12, ch. 2 | [exercise-03.md](Session-05-Linux-Command-Center/exercises/exercise-03.md) | Markdown | Completed | Yes (log was empty) |
| 05 | Exercise 04 - Useless Use of `cat` | Slide 12, ch. 3 | [exercise-04.md](Session-05-Linux-Command-Center/exercises/exercise-04.md) | Markdown | Completed | Yes |
| 06 | Exercise 01 - age calculator | Slide 11 | [exercise-01.sh](Session-06-Bash-Scripting-Fundamentals/scripts/exercise-01.sh), [exercise-01.md](Session-06-Bash-Scripting-Fundamentals/exercises/exercise-01.md) | Bash + Markdown | Completed | Yes |
| 06 | Exercise 02 - system health check | Slide 12 | [exercise-02.sh](Session-06-Bash-Scripting-Fundamentals/scripts/exercise-02.sh), [exercise-02.md](Session-06-Bash-Scripting-Fundamentals/exercises/exercise-02.md) | Bash + Markdown | Completed | Yes (low-memory branch simulated) |
| 06 | Exercise 03 - rectangle area and perimeter | Slide 13, ch. 1 | [exercise-03.sh](Session-06-Bash-Scripting-Fundamentals/scripts/exercise-03.sh), [exercise-03.md](Session-06-Bash-Scripting-Fundamentals/exercises/exercise-03.md) | Bash + Markdown | Completed | Yes |
| 06 | Exercise 04 - user existence check | Slide 13, ch. 2 | [exercise-04.sh](Session-06-Bash-Scripting-Fundamentals/scripts/exercise-04.sh), [exercise-04.md](Session-06-Bash-Scripting-Fundamentals/exercises/exercise-04.md) | Bash + Markdown | Completed | Yes |

## Adding a new session

1. Create `Session-NN-<Title>/` with a `README.md` (topics, exercise list with source slide, run instructions, requirements) and an `exercises/` folder. Add `scripts/` or `data/` only if the session needs them.
2. Name files `exercise-NN.md` / `exercise-NN.sh`; NN follows the order in the slides (practical scenario first, then homework items).
3. Add a row to the **Sessions** table and one row per exercise to the **Exercise tracking** table above.
4. Do not edit completed sessions unless a correction is needed.
5. Before committing, run `bash -n` on every new script and check that links in the READMEs resolve.
