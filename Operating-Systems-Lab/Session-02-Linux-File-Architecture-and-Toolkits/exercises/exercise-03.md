# Exercise 03 - Challenge 2: links lab

**Source:** Session 02 slides, slide 14, challenge 2

## Objective

Create `info.txt`, make a hard link and a soft link to it, delete the original with `rm`, then read both links with `cat`. What happens, and why?

## Solution

```bash
echo "Hello from info.txt" > info.txt   # create the file
ln info.txt info_h.txt                  # hard link  (the slide calls it "h")
ln -s info.txt info_s.txt               # soft link  (the slide calls it "s")
ls -li                                  # compare inode numbers
rm info.txt                             # delete the original name
cat info_h.txt                          # check the hard link
cat info_s.txt                          # check the soft link
```

The slide only hints at the link names with `h` and `s`; `info_h.txt` and `info_s.txt` are the names chosen here.

## Result

**Verified output** (inode numbers differ on every system):

```text
$ ls -li
532536 -rw-r--r-- 2 root root 20 Nov  8 07:52 info.txt
532536 -rw-r--r-- 2 root root 20 Nov  8 07:52 info_h.txt
532537 lrwxrwxrwx 1 root root  8 Nov  8 07:52 info_s.txt -> info.txt
$ rm info.txt
$ cat info_h.txt
Hello from info.txt
$ cat info_s.txt
cat: info_s.txt: No such file or directory
$ ls -li
532536 -rw-r--r-- 1 root root 20 Nov  8 07:52 info_h.txt
532537 lrwxrwxrwx 1 root root  8 Nov  8 07:52 info_s.txt -> info.txt
```

## What you see and why

- **`info_h.txt` still prints the content.** A hard link is just another name for the same inode (same number, `532536` above). The data is freed only when the link count reaches 0, and `rm info.txt` only lowered it from 2 to 1.
- **`info_s.txt` fails.** A soft link is its own file (different inode) that stores the *path* `info.txt`. After the original name was removed, the path leads nowhere, so the link is broken (a dangling link) and `cat` reports "No such file or directory".
