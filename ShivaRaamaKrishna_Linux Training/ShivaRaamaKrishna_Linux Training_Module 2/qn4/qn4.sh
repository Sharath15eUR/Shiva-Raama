pid=$(ps aux --sort=-%mem | awk 'NR==2 {print $2}') && kill -9 $pid
