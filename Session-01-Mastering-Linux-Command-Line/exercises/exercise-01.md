# Exercise 01 - Practical scenario: discover the owner of the password file

**Source:** Session 01 slides, slide 14 ("Practical scenario: mission to discover password ownership")

## Objective

Run six steps in order to practise `pwd`, `cd`, absolute paths and `ls -la`, and find out who owns `/etc/passwd`.

| Step | Task from the slide |
|------|---------------------|
| 1 | Locate: find the full path of your home directory |
| 2 | Move: go to the configuration directory using an absolute path |
| 3 | Verify: check that you really are in `/etc` |
| 4 | Scan: list the contents with full details |
| 5 | Analyze: who is the owner of the `passwd` file? |
| 6 | Return: go back to the home directory with one short command |

## Solution

```bash
pwd          # 1. print the home directory path
cd /etc      # 2. absolute path to the configuration directory
pwd          # 3. verify: prints /etc
ls -la       # 4. long listing including hidden files
cd ~         # 6. back to the home directory (plain `cd` works too)
```

Step 5 needs no new command: read the owner of the `passwd` line in the `ls -la` output (or run `ls -l passwd` to see only that file).

## Explanation

- `pwd` (print working directory) shows where you are. Step 1 assumes the terminal starts in the home directory, which is the default for a new session.
- `cd /etc` starts with `/`, so it is an absolute path and works from anywhere.
- `ls -la` combines `-l` (long format with permissions, owner, group, size, date) and `-a` (show hidden entries such as `.` and `..`).
- `cd ~` expands `~` to the home directory. `cd` with no argument does the same.

## Result

**Verified output** (sandbox, user `root`, so home is `/root`; first lines only):

```text
$ pwd
/root
$ cd /etc
$ pwd
/etc
$ ls -la | head -6
total 696
drwxr-xr-x 73 root root    4096 Oct 30 01:08 .
drwxr-xr-x 22 root root    4096 Nov  8 07:51 ..
drwxr-xr-x  3 root root    4096 Oct 30 01:04 .java
-rw-------  1 root root       0 Oct 24 14:05 .pwd.lock
drwxr-xr-x  2 root root    4096 Oct 30 01:04 ImageMagick-6
$ ls -l passwd
-rw-r--r-- 1 root root 1111 Oct 30 01:08 passwd
$ cd ~
```

**Answer to step 5:** the owner of `/etc/passwd` is `root` (group `root` as well).

## Note on the slide wording

The slide asks to look at the "fourth column" of the output. In `ls -l` the owner is the **third** field (permissions, link count, owner, group, ...), and the fourth field is the group. Here both are `root`, so the answer is the same either way.
