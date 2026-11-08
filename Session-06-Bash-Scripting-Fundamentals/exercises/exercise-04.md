# Exercise 04 - Homework challenge 2: user existence check

**Source:** Session 06 slides, slide 13, challenge 2 ("Terminal workshop: user existence check")

## Objective

Write a script named `check_user.sh` that takes a username as `$1` (a command-line argument) and uses tools such as `grep` on `/etc/passwd` to check whether that user exists on the Linux system.

**Script:** [../scripts/exercise-04.sh](../scripts/exercise-04.sh) (named `check_user.sh` in the slide; rename the file if your submission requires that exact name)

## Solution

```bash
./exercise-04.sh root
```

The core of the script:

```bash
if cut -d ':' -f 1 /etc/passwd | grep -qxF -- "$username"; then
    echo "User '$username' exists on this system."
else
    echo "User '$username' does not exist on this system."
    exit 1
fi
```

## Explanation

- `$1` is the first argument; `$#` is the number of arguments. The script prints a usage message and exits with status 2 when it does not receive exactly one argument.
- In `/etc/passwd` the username is the first `:`-separated field, so `cut -d ':' -f 1` extracts only the names.
- `grep -qxF` is silent (`-q`), matches the **whole line** (`-x`) and treats the name literally (`-F`). A plain `grep ali /etc/passwd` would wrongly succeed for `alice`, `natalie` or for any line that merely contains "ali" (for example in the home directory path).
- The exit status is `0` if the user exists, `1` if not, `2` for wrong usage, so the script can be used in other scripts.

## Result

**Verified output:**

```text
$ ./exercise-04.sh root
User 'root' exists on this system.            (exit status 0)
$ ./exercise-04.sh nosuchuser123
User 'nosuchuser123' does not exist on this system.   (exit status 1)
$ ./exercise-04.sh roo
User 'roo' does not exist on this system.     (exit status 1; partial names do not match)
$ ./exercise-04.sh
Usage: ./exercise-04.sh <username>            (exit status 2, printed to stderr)
```
