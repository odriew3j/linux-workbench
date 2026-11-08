# Exercise 03 - Challenge 2: deep search for `.conf` files

**Source:** Session 03 slides, slide 14, challenge 2 ("Deep search")

## Objective

Write a command that searches the whole `/etc` directory and all its subdirectories recursively and finds the files with the `.conf` suffix (the slide notes that `find` is needed).

## Solution

```bash
find /etc -type f -name "*.conf"
```

To hide "Permission denied" messages when running as a normal user, send stderr to the black hole (redirection from the same session):

```bash
find /etc -type f -name "*.conf" 2>/dev/null
```

## Explanation

- `find /etc` walks `/etc` and every subdirectory recursively; no extra option is needed for that.
- `-type f` keeps regular files only.
- `-name "*.conf"` matches names ending in `.conf`. The pattern is a wildcard, handled by `find` itself, so it is quoted to stop the shell from expanding it first.
- `2>/dev/null` discards stderr (file descriptor 2) only; the results on stdout are untouched.

## Result

**Verified output** (sandbox; the list depends on the installed packages, so it differs per machine):

```text
$ find /etc -type f -name "*.conf" 2>/dev/null | sort | head -5
/etc/PackageKit/PackageKit.conf
/etc/PackageKit/Vendor.conf
/etc/adduser.conf
/etc/ca-certificates.conf
/etc/dbus-1/system.d/com.ubuntu.SoftwareProperties.conf
$ find /etc -type f -name "*.conf" 2>/dev/null | wc -l
75
```
