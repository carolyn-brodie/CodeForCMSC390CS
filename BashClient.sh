#!/bin/bash

# --- Configuration ---
HOST="127.0.0.1"
PORT="8080"
MESSAGE="Hello Server!"
# ---------------------

echo "Attempting to connect to $HOST on port $PORT..."

# Use 'nc' to connect and send the message
# -w 1 sets a 1 second timeout for the connection/read
RESPONSE=$(echo "$MESSAGE" | nc -w 1 "$HOST" "$PORT")

if [ $? -eq 0 ]; then
    echo "Connection successful. Message sent."
    echo "Server response:"
    echo "---"
    echo "$RESPONSE"
    echo "---"
else
    echo "Connection failed or timed out."
    echo "Ensure a server is running at $HOST:$PORT and 'nc' is installed."
fi