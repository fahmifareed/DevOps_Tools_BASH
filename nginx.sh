#!/bin/bash

# Install NGINX
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y nginx
elif command -v yum > /dev/null; then
    sudo yum update
    sudo yum install -y nginx
elif command -v dnf > /dev/null; then
    sudo dnf update
    sudo dnf install -y nginx
else
    echo "Unsupported package manager"
    exit 1
fi

# Enable and start NGINX
sudo systemctl enable nginx
sudo systemctl start nginx

# Verify installation
nginx -v

echo "NGINX installation completed!"