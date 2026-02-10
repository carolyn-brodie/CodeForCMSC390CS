#!/bin/bash

# A simple TCP port scanner using /dev/tcp

# Check for correct usage
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <IP_address> <start_port> <end_port>"
    echo "Example: $0 192.168.1.1 1 100"
    exit 1
fi

IP=$1
START_PORT=$2
END_PORT=$3

echo "Scanning $IP from port $START_PORT to $END_PORT..."

# Loop through the specified port range
for ((PORT=$START_PORT; PORT<=$END_PORT; PORT++))
do
    # Attempt to open a TCP connection to the specified IP and port
    # Redirect stdout and stderr to /dev/null to suppress connection error messages
    (echo >/dev/tcp/$IP/$PORT) >/dev/null 2>&1

    # Check the exit status of the previous command
    if [ $? -eq 0 ]; then
        echo "Port $PORT is open"
    fi
done

echo "Scan finished."
