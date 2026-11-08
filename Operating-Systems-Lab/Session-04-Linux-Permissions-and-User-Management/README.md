# Session 04 - Linux Permissions and User Management

The multi-user model (users, groups, UID/GID, root), where identities are stored (`/etc/passwd`, `/etc/shadow`), reading `ls -l`, the meaning of `rwx` on files vs. directories, octal notation, `chmod`, `chown`/`chgrp`, and `umask`.

Source: `4__Linux_Permissions_and_User_Management.pdf`

## Exercises

| # | Exercise | Original reference | Solution |
|---|----------|--------------------|----------|
| 01 | Practical scenario: shared directory for the development team | Slide 11 | [exercise-01.md](exercises/exercise-01.md) |
| 02 | Terminal challenge: remove only the group's execute permission | Slide 12, practical mission | [exercise-02.md](exercises/exercise-02.md) |
| 03 | Theory challenge: default directory permission with `umask 027` | Slide 12, theory challenge | [exercise-03.md](exercises/exercise-03.md) |

This session has no Bash scripts: every exercise is a terminal or theory task.

## Requirements

- Linux with Bash and `sudo` rights for Exercise 01 (`groupadd` and `chgrp` change system state).
- Run all experiments in a scratch directory. Exercise 01 creates a group; use a virtual machine or container if you do not want to touch your main system, and remove the group afterwards with `sudo groupdel developers`.
