# Exercise 03 - Theory challenge: default directory permission with `umask 027`

**Source:** Session 04 slides, slide 12, practical mission for next week ("Theory challenge")

## Objective

If the system `umask` is set to `027`, what will be the default permission of a newly created **directory**, written in symbolic form?

## Solution

**`rwxr-x---`** (octal `750`)

## Explanation

New directories start from `777`, and the `umask` removes the bits it contains:

| | Owner | Group | Others |
|---|-------|-------|--------|
| Raw directory | 7 (`rwx`) | 7 (`rwx`) | 7 (`rwx`) |
| `umask 027` | 0 | 2 (`-w-`) | 7 (`rwx`) |
| Result | 7 (`rwx`) | 5 (`r-x`) | 0 (`---`) |

`777 - 027 = 750`, which is `rwxr-x---`: the owner has full access, the group can read and enter but not modify, and others have no access.

For comparison, new regular files start from `666` (Linux never makes files executable by default), giving `666 - 027 = 640`, i.e. `rw-r-----`.

Strictly speaking, `umask` clears bits (it is a bit mask) rather than doing arithmetic subtraction. For the usual values the result is the same as the subtraction taught in the slides.

## Result

**Verified output** (run in a subshell so the umask change does not stay active):

```text
$ ( umask 027; mkdir newdir; touch newfile; ls -ld newdir newfile )
drwxr-x--- 2 root root 4096 Nov  8 07:52 newdir
-rw-r----- 1 root root    0 Nov  8 07:52 newfile
```
