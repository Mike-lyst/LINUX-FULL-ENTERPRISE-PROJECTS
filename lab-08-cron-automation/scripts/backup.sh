#!/bin/bash
BASE_DIR="$(pwd)"                   # project root
SOURCE_DIR="$BASE_DIR/data"         # folder to back up
BACKUP_DIR="$BASE_DIR/backups"
LOG_FILE="$BASE_DIR/logs/backup.log"
MAX_BACKUPS=5

mkdir -p "$SOURCE_DIR" "$BACKUP_DIR" "$(dirname "$LOG_FILE")"

# Check source folder
if [ ! -d "$SOURCE_DIR" ]; then
    echo "[$(date)] ERROR: Source directory does not exist!" >> "$LOG_FILE"
    exit 1
fi

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

echo "[$(date)] Starting backup..." >> "$LOG_FILE"

# Backup using relative path (so restore works properly)
tar -C "$BASE_DIR" -czf "$BACKUP_FILE" "$(basename "$SOURCE_DIR")" 2>> "$LOG_FILE"

if [ $? -eq 0 ]; then
    echo "[$(date)] Backup successful: $BACKUP_FILE" >> "$LOG_FILE"
else
    echo "[$(date)] Backup failed!" >> "$LOG_FILE"
    exit 1
fi

echo "[$(date)] Backup job completed." >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"