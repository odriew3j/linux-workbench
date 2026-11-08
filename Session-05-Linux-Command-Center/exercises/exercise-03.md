# Exercise 03 - Mental challenge 2: structure analysis

**Source:** Session 05 slides, slide 12, mental challenge 2 ("Structure analysis")

## Objective

Analyse the structure of this command:

```bash
dmesg | grep -i error > kernel_errors.log
```

## Solution

The line is a **pipeline of two commands whose final output is redirected to a file**:

| Part | Role |
|------|------|
| `dmesg` | Prints the kernel ring buffer (boot and hardware messages) to **stdout** |
| `\|` | Pipe: connects the stdout of `dmesg` to the **stdin** of `grep` |
| `grep -i error` | Keeps only the lines containing "error", ignoring letter case |
| `> kernel_errors.log` | Redirects the stdout of `grep` into the file, **overwriting** it if it exists |

Nothing appears on the screen, because the final stdout goes to the file. Stderr (fd 2) is not touched by the pipe or by `>`, so error messages still appear on the terminal.

## Explanation

- Only stdout flows through `|`; each command in a pipeline runs as its own process at the same time.
- The redirection `>` applies to the **last** command (`grep`), not to `dmesg`.
- Use `>>` to append instead of overwriting.
- On systems where reading the kernel log is restricted (`kernel.dmesg_restrict=1`), a normal user gets a permission error from `dmesg` on stderr. In that case `sudo dmesg | grep -i error > kernel_errors.log` works, because the redirection is performed by your own shell in a directory you can write to.

## Result

**Verified** (sandbox, user `root`): the pipeline ran with exit statuses `0 1` (`dmesg` succeeded, `grep` found no match), and `kernel_errors.log` was created with 0 lines because this sandbox's kernel log contains no "error" text. The command's behaviour was verified; the usual content (hardware or driver errors) depends on the machine.
