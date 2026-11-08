# Exercise 02 - Challenge 1: the one-line architect

**Source:** Session 02 slides, slide 14, challenge 1

## Objective

With a **single `mkdir` command**, create exactly this tree:

```text
project/
└── assets/
    ├── css/
    ├── pages/
    └── py/
```

## Solution

```bash
mkdir -p project/assets/{css,pages,py}
```

## Explanation

- `-p` creates the parents (`project`, `project/assets`) automatically.
- `{css,pages,py}` is Bash brace expansion: Bash rewrites the word into `project/assets/css project/assets/pages project/assets/py` before `mkdir` runs, so it is still one command.
- Without brace expansion, the equivalent is `mkdir -p project/assets/css project/assets/pages project/assets/py`.
- Brace expansion is a Bash feature. When the same line was run by a plain `sh`-style shell during testing, it created a single directory literally named `{css,pages,py}`, so run it in Bash.

## Result

**Verified output** (run in Bash; `find project | sort`):

```text
project
project/assets
project/assets/css
project/assets/pages
project/assets/py
```

The long form produced the identical tree.
