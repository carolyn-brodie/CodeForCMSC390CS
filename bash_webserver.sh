#First:
#make sure that you have netcat

#sudo apt install netcat

#Also make script executable:
#chmod +x bash_webserver.sh


#!/bin/bash

PORT=${1:-8080}
CONTENT="<h1>Hello from Bash Web Server!</h1><p>Current time: $(date)</p>"
RESPONSE="HTTP/1.1 200 OK\r\nContent-Type: text/html\r\nContent-Length: ${#CONTENT}\r\n\r\n${CONTENT}"

echo "Serving on http://localhost:$PORT"
echo "Access logs can be found in /tmp/bash_webserver.log"

while true; do
  echo -e "$RESPONSE" | nc -l -p "$PORT" > /tmp/bash_webserver.log
done
