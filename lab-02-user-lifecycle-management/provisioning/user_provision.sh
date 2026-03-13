#!/bin/bash

LOGFILE="$HOME/user_setup.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
CSV_FILE="users.csv"

echo "========== $TIMESTAMP ==========" >> "$LOGFILE"

# Check CSV file exists
if [ ! -f "$CSV_FILE" ]; then
    echo "ERROR: CSV file not found!" >> "$LOGFILE"
    exit 1
fi

# Read CSV, skip header
tail -n +2 "$CSV_FILE" | while IFS=, read USERNAME DEPT
do
    echo "Processing $USERNAME in $DEPT..." >> "$LOGFILE"

    # Create group if not exists
    if ! getent group "$DEPT" > /dev/null; then
        sudo groupadd "$DEPT"
        echo "$TIMESTAMP - Group $DEPT created" >> "$LOGFILE"
    else
        echo "$TIMESTAMP - Group $DEPT already exists" >> "$LOGFILE"
          fi

    # Create department directory
    sudo mkdir -p "/srv/$DEPT"
    sudo chown :"$DEPT" "/srv/$DEPT"
    sudo chmod 770 "/srv/$DEPT"
    sudo chmod g+s "/srv/$DEPT"
    echo "$TIMESTAMP - Directory /srv/$DEPT configured" >> "$LOGFILE"

    # Create user if not exists
    if ! id "$USERNAME" &>/dev/null; then
        sudo useradd -m -g "$DEPT" "$USERNAME"
        sudo passwd -e "$USERNAME"
        echo "$TIMESTAMP - User $USERNAME created" >> "$LOGFILE"
    else
        echo "$TIMESTAMP - User $USERNAME already exists" >> "$LOGFILE"
    fi
done
echo "Provisioning completed." >> "$LOGFILE"
