# Exercise 02 - Terminal challenge: remove only the group's execute permission

**Source:** Session 04 slides, slide 12, practical mission for next week ("Terminal challenge")

## Objective

Write a command that removes **only the execute permission of the group** from the script `deploy.sh`, without changing any other permission, using symbolic mode.

## Solution

```bash
chmod g-x deploy.sh
```

## Explanation

Symbolic mode has the form `[who][operator][permission]`:

- `g` = group (other choices: `u` owner, `o` others, `a` all),
- `-` = remove the permission (`+` adds, `=` sets exactly),
- `x` = execute.

Because the command names only the group and only `x`, all other bits stay as they were. The octal form would need the old mode to be known (for `755` it would be `chmod 745 deploy.sh`), which is why symbolic mode is the right tool here.

## Result

**Verified output** (test file starting from mode 755):

```text
$ ls -l deploy.sh
-rwxr-xr-x 1 root root 0 Nov  8 07:52 deploy.sh
$ chmod g-x deploy.sh
$ ls -l deploy.sh
-rwxr--r-x 1 root root 0 Nov  8 07:52 deploy.sh
$ stat -c '%A %a' deploy.sh
-rwxr--r-x 745
```

Only the group's `x` disappeared; owner (`rwx`) and others (`r-x`) are unchanged.
