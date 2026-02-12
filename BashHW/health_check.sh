#!/bin/bash

echo "==============================="
echo "     SYSTEM HEALTH SUMMARY"
echo "==============================="

echo "Hostname: $(hostname)"

echo "Uptime:"
uptime -p


echo ""
echo "CPU Load (1, 5, 15 min averages):"
uptime | awk -F'load average:' '{ print $2 }'

echo ""
echo "Memory Usage:"
free -h


echo ""
echo "Disk Usage:"
df -h --total | grep -E 'Filesystem|total'


echo ""
echo "Top 5 Memory-Consuming Processes:"
ps aux --sort=-%mem | head -n 6

echo ""
echo "==============================="
echo "Check complete."
