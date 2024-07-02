#!/bin/bash

# Update package list and install GIT
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y git
elif command -v yum > /dev/null; then
    sudo yum update
    sudo yum install -y git
elif command -v dnf > /dev/null; then
    sudo dnf update
    sudo dnf install -y git
else
    echo "Unsupported package manager"
    exit 1
fi

# Verify installation
git --version
which git
git init
ls -a

echo "GIT installation completed!"