#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' 

# Personal details
AUTHOR_NAME="Fahmi Fareed"
LINKEDIN="https://linkedin.com/in/fahmifareed"
GITHUB="https://github.com/fahmifareed"

# Print function with color
print_with_color() {
    echo -e "${!1}${2}${NC}"
}

# Function to display personal details
show_details() {
    print_with_color BLUE "Script created by: $AUTHOR_NAME"
    print_with_color BLUE "LinkedIn: $LINKEDIN"
    print_with_color BLUE "GitHub: $GITHUB"
    echo "--------------------------------------------------"
}

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