# Session 05 - Linux Command Center

Process management, signals and automation: programs vs. processes (PID, PPID, states, `/proc`), monitoring (`ps`, `pstree`, `top`, `htop`), job control (`&`, `jobs`, `fg`, `bg`, `Ctrl+Z`), signals (`kill`, `killall`), the Unix philosophy with I/O redirection and pipes, and scheduling with `at` and `crontab`.

Source: `5__Linux_Command_Center.pdf`

## Exercises

| # | Exercise | Original reference | Solution |
|---|----------|--------------------|----------|
| 01 | Practical mission: hunter of heavy processes | Slide 11 | [exercise-01.md](exercises/exercise-01.md) |
| 02 | Mental challenge 1 - zombie process | Slide 12, challenge 1 | [exercise-02.md](exercises/exercise-02.md) |
| 03 | Mental challenge 2 - structure analysis of a `dmesg` pipeline | Slide 12, challenge 2 | [exercise-03.md](exercises/exercise-03.md) |
| 04 | Mental challenge 3 - Useless Use of `cat` | Slide 12, challenge 3 | [exercise-04.md](exercises/exercise-04.md) |

This session has no Bash scripts: the tasks are terminal commands and theory questions.

## Requirements

- Linux with Bash and `procps` (`ps`, `kill`). Exercise 01 step 5 needs `cron` (`crontab`) and root rights for the cache-clearing command.
- Practise signals only on a throw-away process of your own (for example `sleep 500 &`), never on system processes. The PID `8899` used in the slides is hypothetical.
