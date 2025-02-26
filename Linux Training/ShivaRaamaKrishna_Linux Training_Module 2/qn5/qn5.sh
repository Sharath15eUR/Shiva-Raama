ip route | awk '/default/ {print $3}'| sort -u
