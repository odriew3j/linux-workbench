# Exercise 02 - Mental challenge 1: zombie process

**Source:** Session 05 slides, slide 12, mental challenge 1

## Objective

What is a zombie process, and why is it not removed even by `kill -9`?

## Solution

A **zombie** (state `Z` in `ps`) is a process that has already finished running but still has an entry in the process table, because its **parent has not yet read its exit status** with `wait()`. It uses no CPU or memory apart from that small table entry (PID, exit status).

`kill -9` cannot remove it because **it is already dead**: SIGKILL kills a *running* process, and there is nothing left to kill. The entry disappears only when the parent collects the exit status (reaps the child).

How to get rid of one:

- make the parent call `wait()` (for example by sending the parent `SIGCHLD` if the program handles it), or
- terminate the **parent**. The zombie is then adopted by PID 1 (`init`/`systemd`), which reaps orphans automatically.

A few zombies are harmless; many of them can exhaust the PID table, which points to a bug in the parent program.

## Result

**Verified** (sandbox): a parent that never waits for its child was created (`bash -c 'sleep 1 & exec sleep 30'`).

```text
children of 290:
  PID  PPID STAT COMMAND
  292   290 Z    sleep
after kill -9 on zombie 292:
  PID  PPID STAT COMMAND
  292   290 Z    sleep
after killing the parent:
  PID  PPID STAT COMMAND
  292     1 Z    sleep
```

- The child (which sleeps 1 second) became a zombie (`Z`) as soon as it exited.
- `kill -9` had no effect on it.
- After the parent was killed the zombie was re-parented to PID 1 (`PPID 1`).

**Not observed:** the final reaping. In this sandbox PID 1 is a custom init process that does not reap orphans, so the zombie stayed. A standard init such as `systemd` reaps them, but that was not tested here.
