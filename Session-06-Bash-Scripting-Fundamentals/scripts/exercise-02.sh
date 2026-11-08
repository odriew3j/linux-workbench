#!/usr/bin/env bash
# Session 06 - Exercise 02: System Health Check (final project)
# Combines variables, command substitution, a pipe, arithmetic comparison,
# conditions and file tests into a small health report.
#
# Usage: ./exercise-02.sh

echo "--- System Health Report ---"
echo

# 1. Get the amount of free memory (in MB) using a pipe.
#    Column 4 of the "Mem:" line printed by `free -m` is the "free" column.
#    LC_ALL=C keeps the "Mem:" label in English on non-English systems.
FREE_MEM=$(LC_ALL=C free -m | grep Mem | awk '{print $4}')
echo "Free Memory: ${FREE_MEM} MB"

# 2. Conditional check for low memory (threshold: 500 MB).
if [ "$FREE_MEM" -lt 500 ]; then
    echo "🚨 WARNING: Low Memory!"
else
    echo "✅ Memory status is OK."
fi

# 3. Check that a vital system file exists.
if [ -f "/var/log/syslog" ]; then
    echo "✅ System log file exists."
else
    echo "⚠️  System log file /var/log/syslog not found on this system."
fi
