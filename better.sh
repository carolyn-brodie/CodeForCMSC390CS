#!/bin/bash

HOST=${1:-0.0.0.0}   # IP address to bind to
PORT=${2:-8080}

CONTENT="<h1>Hello from Bash Web Server!</h1><p>Current time: $(date)</p>"
RESPONSE="HTTP/1.1 200 OK\r\nContent-Type: text/html\r\nContent-Length: ${#CONTENT}\r\n\r\n${CONTENT}"

echo "Serving on http://$HOST:$PORT"
echo "Access logs can be found in /tmp/bash_webserver.log"

while true; do
  echo -e "$RESPONSE" | nc -l -s "$HOST" -p "$PORT" > /tmp/bash_webserver.log
done
