#!/bin/bash
# Automated user deprovisioning

USERNAME=$1
BACKUP_DIR=~/user-backups

# Check for input
if [ -z "$USERNAME" ]; then
  echo "Usage: sudo ./deprovision_user.sh <username>"
  exit 1
fi

# Prevent deletion of critical users
if [[ "$USERNAME" == "root" ]]; then
  echo "Error: Cannot delete root user"
  exit 1
fi

# Check if user exists
if id "$USERNAME" &>/dev/null; then
  mkdir -p $BACKUP_DIR
  TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

  # Archive home directory if it exists
  if [ -d /home/$USERNAME ]; then
    tar -czf $BACKUP_DIR/${USERNAME}_home_$TIMESTAMP.tar.gz /home/$USERNAME
      echo "Archived /home/$USERNAME to $BACKUP_DIR"
  else
    echo "No home directory found, skipping archive"
  fi

  # Kill running processes of the user
  sudo pkill -u $USERNAME

  # Delete the user and home directory
  sudo userdel -r $USERNAME
  echo "User $USERNAME deprovisioned successfully"
else
  echo "User $USERNAME does not exist"
fi