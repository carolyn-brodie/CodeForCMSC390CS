#!/bin/bash
TARGET=$1
START_PORT=1
END_PORT=1024

if [ -z "$TARGET" ]; then
    echo "Usage: $0 <target-ip>"
    exit 1
fi

echo "Working please be patient..."
for ((port=$START_PORT; port<=$END_PORT; port++)); do
    timeout 1 bash -c "echo >/dev/tcp/$TARGET/$port" 2>/dev/null \
        && echo "Port $port is OPEN"
done

echo "Work complete."
