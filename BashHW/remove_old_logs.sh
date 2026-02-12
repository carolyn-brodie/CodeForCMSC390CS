#!/bin/bash

LOG_DIR="/path/to/logs"

DAYS=30
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \;
echo "Work Completed."
