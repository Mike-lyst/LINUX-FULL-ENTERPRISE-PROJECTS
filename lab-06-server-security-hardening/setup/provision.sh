#!/bin/bash
# Lab06 Provision Script
# Prepares Ubuntu VM for Linux Server Security & Hardening Lab

echo "===================================="
echo "⚙️  Provisioning Linux Server Security Lab"
echo "===================================="

# 1️⃣ Update & upgrade system
echo -e "\n📦 Updating system..."
sudo apt update -y && sudo apt upgrade -y

# 2️⃣ Install required packages
echo -e "\n📦 Installing required packages..."
sudo apt install -y ufw fail2ban auditd lynis scrot wget curl vim

# 3️⃣ SSH Hardening
echo -e "\n🔐 Configuring SSH hardening..."
SSH_CONF="/etc/ssh/sshd_config"

# Backup current config
sudo cp $SSH_CONF "${SSH_CONF}.bak"

# Disable root login
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' $SSH_CONF

# Disable password authentication
sudo sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' $SSH_CONF

# Restart SSH service
sudo systemctl restart ssh

# 4️⃣ Firewall Configuration (UFW)
echo -e "\n🛡 Configuring UFW firewall..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw --force enable

# 5️⃣ Fail2Ban Configuration
echo -e "\n⛔ Configuring Fail2Ban..."
# Create local jail config if not exists
FAIL2BAN_JAIL="/etc/fail2ban/jail.local"
if [ ! -f "$FAIL2BAN_JAIL" ]; then
    sudo tee $FAIL2BAN_JAIL > /dev/null <<EOL
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
bantime = 600
EOL
fi

# Restart Fail2Ban
sudo systemctl enable fail2ban
sudo systemctl restart fail2ban

# 6️⃣ Auditd Configuration
echo -e "\n📋 Enabling Auditd..."
sudo systemctl enable auditd
sudo systemctl start auditd

# 7️⃣ Optional: Install wkhtmltopdf for PDF reporting
echo -e "\n📄 Installing wkhtmltopdf for report generation..."
sudo apt install -y wkhtmltopdf

# 8️⃣ Verify services
echo -e "\n  Verifying services..."
systemctl status ssh --no-pager | head -n 5
systemctl status ufw --no-pager | head -n 5
systemctl status fail2ban --no-pager | head -n 5
systemctl status auditd --no-pager | head -n 5

echo -e "\n===================================="
echo "✅ Provisioning Completed!"
echo "You can now run: sudo bash setup/self-test.sh"
echo "===================================="
