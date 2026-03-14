#!/bin/bash
# Path inside project
LOG_FILE="../logs/heartbeat.log"
while true
do
 echo "Heartbeat running at $(date)" >> "$LOG_FILE"
 sleep 60
done
