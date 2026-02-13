#!/bin/bash
LOGFILE="/var/log/syslog"
KEYWORDS="error|critical|failed"
tail -F $LOGFILE | grep --line-buffered -E $KEYWORDS | while read -r line; do
    echo "Critical issue detected: $line" | mail -s "Log Alert" admin@example.com
done
