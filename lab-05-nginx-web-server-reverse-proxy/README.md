# Lab 05 — Nginx Web Server & Reverse Proxy

## Overview

This lab demonstrates how to deploy a static website using **Nginx** and configure it as a **reverse proxy**.

The website used in this project is a small static site called **P.E.A.C.E**, created to demonstrate web hosting with Nginx.

## Objectives

In this lab ,I:

- Installed Nginx on a Linux system
- Hosted a static HTML website
- Configured Nginx as a reverse proxy
- Verified web server functionality


## Tools Used

- Linux (Ubuntu)
- Nginx
- HTML / CSS
- Git

## Step 1 — Install Nginx

Update system packages:

sudo apt update

Install nginx:

sudo apt install nginx -y

Verify nginx is running:

sudo systemctl status nginx

## Step 2 — Create Website Directory

sudo mkdir -p /var/www/peace-site

Copy website files:

sudo cp sample-site/* /var/www/peace-site/

## Step 3 — Configure Nginx Server Block

Create configuration file:

sudo nano /etc/nginx/sites-available/peace-site

Add server configuration (see nginx-config.md)

Enable site:

sudo ln -s /etc/nginx/sites-available/peace-site /etc/nginx/sites-enabled/

Test configuration:

sudo nginx -t

Reload nginx:

sudo systemctl reload nginx

## Step 4 — Verify Website

Open browser:

http://localhost

You should see the **P.E.A.C.E website** running.

## Step 5 — Configure Reverse Proxy

Nginx can act as a reverse proxy forwarding requests to backend services.

Example:

- Nginx receives traffic
- Forwards request to backend service (port 3000)

Configuration example is shown in `nginx-config.md`.

## Screenshots

### Nginx Running

See: screenshots/nginx-running.png

### Website Loaded

See: screenshots/website-loaded.png

### Reverse Proxy Working

See: screenshots/reverse-proxy-working.png

## Conclusion

This lab demonstrates how to:

- Deploy static websites with Nginx
- Configure server blocks
- Use Nginx as a reverse proxy
- Manage web servers in Linux environments