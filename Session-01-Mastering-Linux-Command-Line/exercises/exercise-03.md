# Exercise 03 - Architecture research: `/bin` vs `/sbin`

**Source:** Session 01 slides, slide 15, homework 2 ("Architecture research")

## Objective

Explain the difference between the `/bin` and `/sbin` directories.

## Solution

| | `/bin` | `/sbin` |
|---|--------|---------|
| Content | Essential command binaries needed by **all users** and during boot or recovery | Essential **system administration** binaries |
| Typical examples | `ls`, `cp`, `mv`, `cat` | `fdisk`, `mkfs`, `reboot`, `agetty`, `adduser` |
| Intended user | Everyone | The superuser (`root`) |

In the traditional layout, `/sbin` is not in a normal user's `PATH`, which reflects its purpose: these tools change the system itself (partitions, network, users, shutdown) and are meant to be run with administrator rights.

## Explanation

The names come from "binaries" and "system binaries". The split is a convention of the Filesystem Hierarchy Standard: user-facing tools in `bin`, administration tools in `sbin`.

On modern distributions (merged `/usr`), both directories are only symbolic links into `/usr`, so the separation is now conventional rather than physical.

## Result

**Verified output** (sandbox, Ubuntu-based):

```text
$ ls -ld /bin /sbin
lrwxrwxrwx 1 root root 7 Apr 22  2024 /bin -> usr/bin
lrwxrwxrwx 1 root root 8 Apr 22  2024 /sbin -> usr/sbin
$ ls /sbin | head -5
add-shell
addgnupghome
addgroup
adduser
agetty
```

The links confirm the merged-`/usr` layout, and the first entries of `/sbin` are administration tools (adding users and groups, `agetty` for login terminals).
