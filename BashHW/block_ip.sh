#!/bin/bash
if [ -z "$1" ]; then
echo "Usage: $0 "
exit 1
fi
IP="$1"
if ! [[ $IP =~ ^([0-9]{1,3}.){3}[0-9]{1,3}$ ]]; then
echo "Invalid IP address format."
exit 1
fi
if iptables -C INPUT -s "$IP" -j DROP 2>/dev/null; then
echo "IP $IP is already blocked."
else
iptables -A INPUT -s "$IP" -j DROP
echo "IP $IP has been blocked."
fi
