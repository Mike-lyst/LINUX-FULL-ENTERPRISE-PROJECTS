#!/bin/bash
# Lab06 Self-Test Automation (Headless + Real Output)
# Checks SSH hardening, UFW, Fail2Ban, Auditd, and generates HTML/PDF report

echo "===================================="
echo " Lab06 Server Security Self-Test"
echo "===================================="

SCREENSHOT_DIR="/vagrant/screenshots"
REPORT_DIR="/vagrant/reports"
mkdir -p "$SCREENSHOT_DIR"
mkdir -p "$REPORT_DIR"

# Function to capture command output as "text screenshot"
take_screenshot() {
    local filename="$1"
    shift
    echo "==== $filename ====" > "$SCREENSHOT_DIR/$filename.txt"
    "$@" >> "$SCREENSHOT_DIR/$filename.txt" 2>&1
}

#  SSH Hardening Check
echo -e "\nChecking SSH Configuration..."
SSH_CONF="/etc/ssh/sshd_config"

take_screenshot "ssh-root-login" grep "^PermitRootLogin no" $SSH_CONF || echo "❌ Root login is ENABLED" >> "$SCREENSHOT_DIR/ssh-root-login.txt"
take_screenshot "ssh-password-auth" grep "^PasswordAuthentication no" $SSH_CONF || echo "❌ Password authentication is ENABLED" >> "$SCREENSHOT_DIR/ssh-password-auth.txt"

# UFW Firewall Check
echo -e "\nChecking UFW Firewall..."
take_screenshot "ufw-status" ufw status verbose
take_screenshot "ufw-ssh-port" ufw status verbose | grep "22"

#  Fail2Ban Check
echo -e "\nChecking Fail2Ban Service..."
take_screenshot "fail2ban-status" systemctl status fail2ban
take_screenshot "fail2ban-jails" fail2ban-client status

# Auditd Check
echo -e "\nChecking Auditd Service..."
take_screenshot "auditd-status" systemctl status auditd

#  Lynis Audit and Report Generation
echo -e "\nRunning Lynis audit..."
LYNIS_REPORT="$REPORT_DIR/lynis-report.html"

# Install Lynis if not installed
if ! command -v lynis &> /dev/null; then
    echo "Installing Lynis..."
    sudo apt -y install lynis
fi

sudo lynis audit system --quick --logfile "$REPORT_DIR/lynis.log"

# Save Lynis log as HTML
echo "<pre>" > "$LYNIS_REPORT"
cat "$REPORT_DIR/lynis.log" >> "$LYNIS_REPORT"
echo "</pre>" >> "$LYNIS_REPORT"

# Convert HTML to PDF 
if command -v wkhtmltopdf &> /dev/null; then
    wkhtmltopdf "$LYNIS_REPORT" "$REPORT_DIR/lynis-report.pdf"
    echo "📄 Lynis PDF report generated in $REPORT_DIR"
else
    echo " wkhtmltopdf not installed — PDF report skipped"
fi

take_screenshot "lynis-report" cat "$REPORT_DIR/lynis.log"

echo -e "\n===================================="
echo "✅ Lab06 Self-Test Completed"
echo "Text 'screenshots' saved in $SCREENSHOT_DIR"
echo "Lynis reports saved in $REPORT_DIR"
echo "===================================="gi