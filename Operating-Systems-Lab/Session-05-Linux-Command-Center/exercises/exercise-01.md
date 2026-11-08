# Exercise 01 - Practical mission: hunter of heavy processes

**Source:** Session 05 slides, slide 11 ("Practical mission: hunter of heavy processes")

## Objective

Scenario: the system has become slow. Find the culprit, stop it, and automate the cleanup.

| Step | Task from the slide |
|------|---------------------|
| 1 | Find the 5 most RAM-consuming processes by combining `ps` and output redirection |
| 2 | View the content of the file you saved |
| 3 | Assume the heaviest process has PID 8899: pause it (SIGTSTP) |
| 4 | The process does not respond: final strike (SIGKILL) |
| 5 | Schedule a cron job that clears the cache every Friday night at 2 |

## Solution

```bash
# 1. top 5 memory consumers (+1 header line) saved to a file
ps aux --sort=-%mem | head -n 6 > heavy_processes.txt

# 2. show the saved file
cat heavy_processes.txt

# 3. pause the process with SIGTSTP (signal 20)
kill -TSTP 8899

# 4. unresponsive: SIGKILL (signal 9)
kill -9 8899

# 5. edit the crontab (as root) and add this line
sudo crontab -e
0 2 * * 5 sync && echo 3 > /proc/sys/vm/drop_caches
```

## Explanation

1. `ps aux` lists all processes with CPU and memory columns; `--sort=-%mem` sorts by memory use, highest first. `head -n 6` keeps the header plus the five heaviest processes, and `>` redirects the result into the file (overwriting it).
2. `cat` prints the file. The PID of the heaviest process is in the second column.
3. `kill` only sends a signal; `-TSTP` asks the process to stop temporarily. The process is frozen, not terminated, and can be resumed with `kill -CONT 8899`. This is the same signal `Ctrl+Z` sends from the keyboard.
4. `kill -9` sends SIGKILL, which the process cannot catch or ignore, so it is the last resort when the polite `SIGTERM` (15, plain `kill PID`) is ignored.
5. A crontab line has five time fields followed by the command: minute `0`, hour `2`, day of month `*`, month `*`, day of week `5` (Friday). `sync` flushes data to disk before `echo 3 > /proc/sys/vm/drop_caches` drops the kernel's page, dentry and inode caches; writing there needs root, hence root's crontab.

## Result

**Verified** (sandbox, user `root`; `cut -c1-100` was added only to shorten the lines for display):

```text
$ ps aux --sort=-%mem | head -n 6 > heavy_processes.txt
$ cut -c1-100 heavy_processes.txt
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root        58  0.2  0.8 2045588 34132 ?       Sl   07:51   0:00 /opt/rclone/rclone-filestore multim
root         1  0.4  0.1  22496  7376 ?        SLl  07:51   0:00 /process_api --firecracker-init --a
root       278  0.0  0.1   7908  4100 ?        R    07:52   0:00 ps aux --sort=-%mem
root       255  0.0  0.0   4336  3380 ?        S    07:52   0:00 bash /tmp/v4.sh
64321       57  0.0  0.0   7328  2916 ?        SL   07:51   0:00 sbx-telemetry-collector
```

On a dummy process (`sleep 500 &`, not PID 8899):

- `kill -STOP` set the state to `T` (stopped) and `kill -CONT` resumed it (`S`).
- `kill -9` ended it; `wait` reported exit status 137 (128 + 9) and the process was gone.

**Not verified here:**

- **SIGTSTP:** `kill -TSTP` had **no visible effect** on the background dummy process in the sandbox (the state stayed `S`). The process has no controlling terminal, and the kernel discards `SIGTSTP` for such orphaned process groups. `SIGSTOP` (19) works there and cannot be ignored. On a normal interactive terminal `SIGTSTP` is expected to stop the process, but that was not reproduced.
- **Step 5:** `crontab` is not installed in the sandbox, so the cron line was not installed or run.

## Ambiguities and choices

- The slide leaves the **cache-clearing command** unspecified. The kernel page-cache drop above is one reasonable reading; a user-level alternative is cleaning `~/.cache`. Both are safe but slow the system briefly while caches refill, so do not schedule them on a machine you care about without need.
- **"Friday night at 2"** is taken as Friday 02:00 (`0 2 * * 5`), the simplest reading. If 2 AM after Friday evening is meant, use day-of-week `6` (`0 2 * * 6`).
- The slide does not show the command for step 1, only the idea ("combine `ps` and redirection"); the command above is one valid way to do it.
