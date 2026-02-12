#!/bin/bash

# Usage:
#   ./detect_sqli.sh request.txt
#   cat request.txt | ./detect_sqli.sh

# Read from file or stdin
if [ -n "$1" ]; then
    INPUT=$(cat "$1")
else
    INPUT=$(cat)
fi

# Common SQL injection patterns
PATTERNS=(
    "'[[:space:]]*or[[:space:]]+1=1"
    "'[[:space:]]*or[[:space:]]+'1'='1"
    "union[[:space:]]+select"
    "select[[:space:]]+.*from"
    "insert[[:space:]]+into"
    "drop[[:space:]]+table"
    "--"
    ";--"
    "xp_cmdshell"
    "information_schema"
)

FOUND=0

echo "Scanning for SQL injection patterns..."
echo "----------------------------------------"

for pattern in "${PATTERNS[@]}"; do
    if echo "$INPUT" | grep -Eiq "$pattern"; then
        echo "[WARNING] Possible SQL injection pattern detected: $pattern"
        FOUND=1
    fi
done

if [ "$FOUND" -eq 0 ]; then
    echo "No obvious SQL injection patterns detected."
else
    echo "Potential SQL injection detected!"
fi
