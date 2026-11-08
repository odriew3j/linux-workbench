#!/usr/bin/env bash
# Helper (not an exercise): generates deterministic sample data for Session 03.
#   data/system.log - 1500 log lines
#   data/data.csv   - header + 1999 rows; row text contains its own line number
# Usage: ./generate-sample-data.sh [output-dir]   (default: ../data)

set -eu

out_dir="${1:-$(dirname "$0")/../data}"
mkdir -p "$out_dir"

# system.log -------------------------------------------------------------
# Level depends on (line number % 5): 0 -> ERROR, 3 -> WARNING, otherwise INFO.
# Every line where (line number % 50) == 2 is an INFO line whose message
# contains the lowercase word "error", so that grep -i behaves differently
# from a case-sensitive grep.
levels=(ERROR INFO INFO WARNING INFO)
: > "$out_dir/system.log"
for i in $(seq 1 1500); do
    level="${levels[$((i % 5))]}"
    if [ "$level" = "ERROR" ]; then
        msg="disk write failed on node-$i"
    elif [ $((i % 50)) -eq 2 ]; then
        msg="recovered from error in module-$i"
    else
        msg="service-$i heartbeat ok"
    fi
    printf '2026-01-01 %02d:%02d:%02d %s %s\n' \
        $((i / 3600 % 24)) $((i / 60 % 60)) $((i % 60)) "$level" "$msg" \
        >> "$out_dir/system.log"
done

# data.csv ---------------------------------------------------------------
echo "line,name,value" > "$out_dir/data.csv"
for i in $(seq 2 2000); do
    echo "$i,item-$i,$((i * 3))" >> "$out_dir/data.csv"
done

echo "Sample data written to: $out_dir"
