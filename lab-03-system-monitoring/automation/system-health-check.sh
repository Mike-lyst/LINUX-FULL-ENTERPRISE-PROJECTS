

#!/bin/bash

echo "SYSTEM HEALTH REPORT"
echo "--------------------"

echo ""
echo "System Uptime:"
uptime

echo ""
echo "Disk Usage:"
df -h

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "Top CPU Processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

echo ""
echo "Active Users:"
who


echo ""
echo "Health check completed".
