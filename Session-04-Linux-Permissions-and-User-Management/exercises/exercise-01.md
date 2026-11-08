# Exercise 01 - Practical scenario: shared directory for the development team

**Source:** Session 04 slides, slide 11 ("Practical scenario: designing a shared folder for the development team")

## Objective

Create a directory `shared` where the owner and the members of the group `developers` can create files, while all other users may only list the files.

## Solution

| Step | Task | Command |
|------|------|---------|
| 1 | Create the group and the raw directory | `sudo groupadd developers` then `mkdir shared` |
| 2 | Give the directory to the group | `sudo chgrp developers shared` |
| 3 | Set permissions (owner `rwx`, group `rwx`, others `r-x`) | `chmod 775 shared` |
| 4 | Check the result | `ls -ld shared` |

```bash
sudo groupadd developers
mkdir shared
sudo chgrp developers shared
chmod 775 shared
ls -ld shared
```

Expected state: `drwxrwxr-x ... developers ... shared`.

## Explanation

- `groupadd` creates the group (a new entry in `/etc/group`); this needs root.
- `chgrp developers shared` changes only the group owner of the directory (changing the group to one you are not a member of also needs root).
- `775` is `7` (`rwx`, 4+2+1) for the owner, `7` for the group and `5` (`r-x`, 4+0+1) for others. On a directory, `w` lets users create, delete and rename entries, `r` lets them list names and `x` lets them enter it with `cd`.
- `ls -ld` shows the directory itself (`-d`) instead of its contents.

## Result

**Not executed as written:** `sudo groupadd developers` changes the system's group database, so it was not run.

**Verified output** of the remaining steps, using the existing group `users` as a stand-in for `developers` (sandbox, user `root`):

```text
$ mkdir shared
$ ls -ld shared
drwxr-xr-x 2 root root 4096 Nov  8 07:52 shared
$ chgrp users shared
$ chmod 775 shared
$ ls -ld shared
drwxrwxr-x 2 root users 4096 Nov  8 07:52 shared
```

The permission string and group change are exactly the ones the exercise expects.

## Notes

- The slide's final output shows `root` as the owner because the commands were run as root. When you run `mkdir shared` as a normal user, you are the owner, e.g. `drwxrwxr-x 2 youruser developers 4096 ... shared`.
- You must be a member of `developers` (or the owner) to create files there. Add a user with `sudo usermod -aG developers username`; the user must log in again for it to apply. This command is not in the slides and is only needed if you want to test file creation.
- `r-x` for "others" also lets them `cd` into the directory and read files whose own permissions allow it, not just see the list of names.
