# Lab 06: Server Security Hardening (Ubuntu)

##  Architecture

User → SSH (Port 2222) → UFW Firewall → Fail2Ban → System Logs → auditd → Lynis Scan

##  Project Overview
## Scenario
Simulated multiple failed SSH login attempts and analyzed logs to detect brute-force behavior.

##  Key Security Implementations
- SSH Hardening
- Firewall Configuration (UFW)
- Fail2Ban Intrusion Prevention
- System Auditing (auditd)
- Security Scanning (Lynis)

##  Tools Used
- Ubuntu Server
- Vagrant + VirtualBox
- UFW
- Fail2Ban
- auditd
- Lynis

##  Setup Instructions
```bash
vagrant up
```
##  Automation

- Provisioning automated using Vagrant
- Security validation automated with self-test.sh
- Lynis scan integrated into testing workflow