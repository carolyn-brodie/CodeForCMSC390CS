#!/bin/bash

LOG_FILE="/var/log/auth.log"
THRESHOLD=5
echo "Monitoring failed SSH login attempts..."

grep "Failed password" $LOG_FILE | \
awk '{print $(NF-3)}' | \
sort | uniq -c | sort -nr | \
while read count ip; do
    if [ "$count" -ge "$THRESHOLD" ]; then
        echo "Possible brute-force attack from $ip ($count attempts)"
    fi
done
