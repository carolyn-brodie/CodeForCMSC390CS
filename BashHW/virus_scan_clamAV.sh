#!/bin/bash

# Default directory to scan (can override with argument)
SCAN_DIR=${1:-/home}

LOG_FILE="/var/log/virus_scan.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

echo "=====================================" | tee -a "$LOG_FILE"
echo "Virus Scan Started: $DATE" | tee -a "$LOG_FILE"
echo "Scanning Directory: $SCAN_DIR" | tee -a "$LOG_FILE"
echo "=====================================" | tee -a "$LOG_FILE"

# Check if clamscan exists
if ! command -v clamscan &> /dev/null; then
    echo "ClamAV is not installed. Install it with:" | tee -a "$LOG_FILE"
    echo "  sudo apt install clamav" | tee -a "$LOG_FILE"
    exit 1
fi

# Update virus definitions
echo "Updating virus definitions..." | tee -a "$LOG_FILE"
freshclam | tee -a "$LOG_FILE"

# Run the scan
echo "Running virus scan..." | tee -a "$LOG_FILE"
clamscan -r --infected --bell "$SCAN_DIR" | tee -a "$LOG_FILE"

echo "Scan complete." | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
