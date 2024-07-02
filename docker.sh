#!/bin/bash

# Update package list and install Docker
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y docker.io
elif command -v yum > /dev/null; then
    sudo yum update
    sudo yum install -y docker
elif command -v dnf > /dev/null; then
    sudo dnf update
    sudo dnf install -y docker
else
    echo "Unsupported package manager"
    exit 1
fi

# Enable and start Docker
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker

# Verify installation
docker --version

echo "Docker installation completed!"