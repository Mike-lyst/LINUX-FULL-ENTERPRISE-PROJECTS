LOG="/var/log/user_audit.log"
DATE=$(date)

echo "User Audit Report - $DATE" >> $LOG
echo "--------------------------" >> $LOG

echo "Active Users:" >> $LOG
who >> $LOG

echo "" >> $LOG
echo "Last Login Records:" >> $LOG
lastlog | grep -v "Never logged in" >> $LOG

echo "" >> $LOG
echo "Users with UID >= 1000:" >> $LOG
awk -F: '$3 >= 1000 {print $1}' /etc/passwd >> $LOG

echo "Audit Completed" >> $LOG
echo "=========================" >> $LOG
