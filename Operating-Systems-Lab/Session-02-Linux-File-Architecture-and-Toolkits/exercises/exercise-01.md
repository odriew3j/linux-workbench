# Exercise 01 - Practical scenario: build the `lab2` project structure

**Source:** Session 02 slides, slide 13 ("Practical scenario: implementing the lab2 project architecture")

## Objective

Create a small project, back up a file, rename it, edit it with Vim and archive the whole project.

## Solution

| Step | Task | Command |
|------|------|---------|
| 1 | Build the nested structure | `mkdir -p lab2/source lab2/backup` |
| 2 | Enter the folder and create the file | `cd lab2/source && touch app.py` |
| 3 | Copy the file into the backup folder | `cp app.py ../backup/` |
| 4 | Rename the original file | `mv app.py main.py` |
| 5 | Edit and save (write a comment, exit with `:wq`) | `vim main.py` |
| 6 | Archive the whole project as the final backup | `tar -czvf lab2_archive.tar.gz ../../lab2/` |

Vim keystrokes for step 5 (interactive, so done by hand):

1. `vim main.py` opens the file in Normal mode.
2. Press `i` to enter Insert mode and type a comment, e.g. `# Lab 2 sample program`.
3. Press `Esc` to return to Normal mode.
4. Type `:wq` and press Enter to write the file and quit.

## Explanation

- `mkdir -p` creates missing parent directories in one go.
- `&&` runs `touch app.py` only if `cd` succeeded.
- `cp` leaves the original in place; `mv` renames it (same directory, new name).
- `tar -czvf`: `c` create, `z` compress with gzip, `v` verbose, `f` archive file name. From `lab2/source`, `../../lab2/` points back to the `lab2` directory.

## Result

**Verified output** (steps 1-4 and 6 were run; the Vim step was replaced by `echo '# Lab 2 sample program' >> main.py`, because Vim is interactive):

```text
$ tar -czvf lab2_archive.tar.gz ../../lab2/
../../lab2/
../../lab2/source/
../../lab2/source/main.py
../../lab2/source/lab2_archive.tar.gz
../../lab2/backup/
../../lab2/backup/app.py
$ tar -tzf lab2_archive.tar.gz
lab2/
lab2/source/
lab2/source/main.py
lab2/source/lab2_archive.tar.gz
lab2/backup/
lab2/backup/app.py
```

`tar` also printed `Removing leading '../../' from member names` on stderr, so the stored paths start with `lab2/`.

## Observations

- The slide's command writes the archive **inside** the directory being archived, so `lab2_archive.tar.gz` appears in its own listing. The command still exits successfully, and the slide's command is kept as given. To avoid this, create the archive from the parent directory instead, e.g. `cd ../.. && tar -czvf lab2_archive.tar.gz lab2/` (not run here).
- Extract an archive with `tar -xzvf lab2_archive.tar.gz`.
