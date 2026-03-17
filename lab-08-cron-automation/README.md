Project Type: Linux Automation / Backup & Restore
Environment: WSL Ubuntu / VSCode

This project simulates a production-style backup system using Bash scripts. It includes automated backups, logging, and restore functionality all safely contained within the project folder.

lab-08-cron-automation/
├── data/                 # Folder containing files to backup
├── backups/             # Backup archives stored here
├── logs/                 # Logs for backup and restore operations
├── restore/              # Restored files appear here
├── scripts/
│   ├── backup.sh         # Backup script
│   └── restore.sh        # Restore script
├── README.md             # Project documentation


Features

Backs up the data/ folder into timestamped .tar.gz archives.

Maintains logs of backup and restore operations.

Keeps the last 5 backups, automatically deleting older ones.

Restores the latest backup to the restore/ folder.

Uses relative paths for portability.

Simulates real-world backup and recovery workflows.

Make scripts executable:
```bash
chmod +x scripts/*.sh
```
Create the data folder and add test files:
```bash
mkdir -p data
echo "Hello world" > data/file1.txt
echo "Backup test file" > data/file2.txt
```
Ensure backfile and logs exist (scripts will auto-create if missing):
```bash
mkdir -p backfile logs
```
 Usage
Run Backup
bash scripts/backup.sh

Creates a timestamped backup in backups/.

Logs success or failure in logs/backup.log.

Run Restore
bash scripts/restore.sh

Restores the latest backup into restore/.

Logs actions in logs/restore.log.

Testing Backup & Restore

Modify or add files to data/.

Run backup.sh and check backups/ for new .tar.gz files.

Delete the data/ folder to simulate data loss:
```bash
rm -rf data 
```

Run restore.sh and verify files appear in restore/data/.

Check logs for detailed operation history:
```bash
cat logs/backup.log
cat logs/restore.log
````