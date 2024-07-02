#!/bin/bash

# Install Redis
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y redis-server
elif command -v yum > /dev/null; then
    sudo yum update
    sudo yum install -y redis
elif command -v dnf > /dev/null; then
    sudo dnf update
    sudo dnf install -y redis
else
    echo "Unsupported package manager"
    exit 1
fi

# Enable and start Redis
sudo systemctl enable redis
sudo systemctl start redis

# Verify installation
redis-cli --version

echo "Redis installation completed!"