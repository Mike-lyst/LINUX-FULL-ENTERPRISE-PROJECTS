#!/bin/bash
BASE_DIR="$(pwd)"
BACKUP_DIR="$BASE_DIR/backfile"
RESTORE_DIR="$BASE_DIR/restore"
LOG_FILE="$BASE_DIR/logs/restore.log"

mkdir -p "$RESTORE_DIR" "$(dirname "$LOG_FILE")"

echo "[$(date)] Starting restore..." >> "$LOG_FILE"

# Find latest backup
LATEST_BACKUP=$(ls -t "$BACKUP_DIR"/*.tar.gz 2>/dev/null | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "[$(date)] ERROR: No backup files found!" >> "$LOG_FILE"
    exit 1
fi

# Extract backup
tar -xzf "$LATEST_BACKUP" -C "$RESTORE_DIR" 2>> "$LOG_FILE"

if [ $? -eq 0 ]; then
    echo "[$(date)] Restore successful to $RESTORE_DIR" >> "$LOG_FILE"
else
    echo "[$(date)] Restore failed!" >> "$LOG_FILE"
    exit 1
fi

echo "[$(date)] Restore completed." >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"