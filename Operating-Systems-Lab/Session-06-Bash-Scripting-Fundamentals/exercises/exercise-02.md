# Exercise 02 - Final project: system health check

**Source:** Session 06 slides, slide 12 ("Final project: system health check")

## Objective

Combine variables, arithmetic comparison, conditions and comments into a small system-management tool that reports free memory and checks that the system log exists.

**Script:** [../scripts/exercise-02.sh](../scripts/exercise-02.sh)

## Solution

```bash
./exercise-02.sh
```

## Explanation

1. **Free memory with a pipe:** `FREE_MEM=$(LC_ALL=C free -m | grep Mem | awk '{print $4}')`. `free -m` prints memory in MB, `grep Mem` keeps the `Mem:` line and `awk '{print $4}'` prints its fourth column (*free*). The result is stored with command substitution `$( )`.
2. **Low-memory check:** `if [ "$FREE_MEM" -lt 500 ]` compares numbers (`-lt` = less than) against a 500 MB threshold.
3. **File test:** `if [ -f "/var/log/syslog" ]` checks that the log file exists as a regular file.

## Differences from the slide

The logic is the slide's. Small additions:

- `#!/usr/bin/env bash` instead of `#!/bin/bash`.
- `LC_ALL=C` in front of `free`, so the line label stays `Mem:` on systems with a non-English locale.
- An `else` branch for the log check, because `/var/log/syslog` does not exist on every system (the sandbox used for testing has none).
- Column 4 of `free` is the *free* memory, which excludes reclaimable cache; the *available* column (7) is a better estimate on real servers, but the slide's column is kept.

## Result

**Verified output** (sandbox with 3990 MB total memory; no `/var/log/syslog` there):

```text
--- System Health Report ---

Free Memory: 3892 MB
✅ Memory status is OK.
⚠️  System log file /var/log/syslog not found on this system.
```

**Simulated output of the low-memory branch.** To exercise the warning, `free` was temporarily replaced by a stub that reports 320 MB free (the value shown on the slide); the script itself was not changed:

```text
--- System Health Report ---

Free Memory: 320 MB
🚨 WARNING: Low Memory!
⚠️  System log file /var/log/syslog not found on this system.
```

The "log file exists" message was not reached in the sandbox; on a system that has `/var/log/syslog` (for example Ubuntu) it prints `✅ System log file exists.`
