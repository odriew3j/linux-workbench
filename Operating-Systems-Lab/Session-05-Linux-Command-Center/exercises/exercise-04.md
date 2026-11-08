# Exercise 04 - Mental challenge 3: Useless Use of `cat`

**Source:** Session 05 slides, slide 12, mental challenge 3

## Objective

Why is using `cat` (the "Useless Use of Cat", UUOC) considered an architectural mistake in the Linux community?

## Solution

The pattern is a pipeline that starts with `cat file` only to feed another command:

```bash
cat access.log | grep error      # useless use of cat
grep error access.log            # better: grep reads the file itself
grep error < access.log          # also fine: the shell redirects stdin
```

It is considered a mistake because:

1. **It adds a needless process and pipe.** `cat` is started only to copy the file into a pipe; the data is copied through an extra process and kernel buffer.
2. **Most tools already accept file names** (or can read stdin via `<`), so the extra step does not add any capability.
3. **It is less clear and less robust.** Giving the file name directly lets tools use the name in messages, and some tools can do more when they open the file themselves (for example, seeking in a file, which a pipe does not allow).
4. **It reflects a misunderstanding of what `cat` is for.** `cat` means *concatenate*: it is the right tool to join several files (`cat a.txt b.txt > all.txt`) or to display a short file, not to be the first stage of every pipeline.

The performance difference is small for small files, so the point is design discipline: each tool in a Unix pipeline should have a purpose.

## Result

**Verified** (sandbox, small test file): the three forms produced identical output, so the extra `cat` changes nothing except the process count.

```text
error one
error two
```
