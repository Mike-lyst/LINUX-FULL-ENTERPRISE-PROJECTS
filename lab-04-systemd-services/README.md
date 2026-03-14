Project Overview

This project demonstrates creating and managing a custom systemd service on Linux. The service, heartbeat.service, monitors system heartbeat by running a script at startup and continuously in the background. This lab shows practical Linux skills including:

Creating and managing systemd services

Writing executable bash scripts

Managing service logs and auto-restart

Handling working directories and permissions


Setup Instructions

Make the script executable

chmod +x scripts/heartbeat.sh

Copy the service file to systemd directory

sudo cp services/heartbeat.service /etc/systemd/system/

Reload systemd to recognize the new service

sudo systemctl daemon-reload

Enable the service to start at boot

sudo systemctl enable heartbeat.service

Start the service immediately

sudo systemctl start heartbeat.service

Check service status

sudo systemctl status heartbeat.service

You should see: active (running)