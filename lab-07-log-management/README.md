# Lab 07: Log Management & Analysis (Linux)

##  Project Overview
This project demonstrates how to monitor, analyze, and manage system logs in a Linux environment for troubleshooting and security purposes.

##  Objectives
- Understand Linux logging system
- Monitor system activity
- Analyze logs for security events
- Troubleshoot using logs

##  Tools Used
- journalctl
- rsyslog
- /var/log files

##  Log Files Explored
- /var/log/syslog
- /var/log/auth.log
- /var/log/kern.log

##  Key Commands

```bash
journalctl -xe
tail -f /var/log/syslog
cat /var/log/auth.log
```