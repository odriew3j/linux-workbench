# Exercise 04 - Draw the parent-child map of the 5 main directories

**Source:** Session 01 slides, slide 15, homework 3 ("Draw the map")

## Objective

Draw a tree diagram of the parent-child relationship of the five main directories covered in the session: `bin`, `etc`, `home`, `var`, `tmp`.

## Solution

```text
/ (root - the top of the filesystem)
|
+-- bin/    essential executables and basic commands
|
+-- etc/    configuration files and OS settings
|
+-- home/   personal directories of users
|   +-- ali/        example: /home/ali
|
+-- var/    variable-size files
|   +-- log/        example: /var/log (system logs)
|
+-- tmp/    temporary files, cleared on reboot
```

## Explanation

- `/` is the parent of all five directories; Linux has no `C:` or `D:` drives, everything hangs off this single root.
- `home` and `var` are shown with one child each, taken from the examples in the slides (`/home/ali`, `/var/log`).
- On many systems `/tmp` is emptied at boot, as the slide says. The exact policy depends on the distribution.

This exercise is a diagram, so there is no command output to verify.
