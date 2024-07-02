#!/bin/bash

# Update package list and install Ansible
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y ansible
elif command -v yum > /dev/null; then
    sudo yum update
    sudo yum install -y ansible
elif command -v dnf > /dev/null; then
    sudo dnf update
    sudo dnf install -y ansible
else
    echo "Unsupported package manager"
    exit 1
fi

# Setup SSH key for Ansible
cd /etc/ansible
ls
vi hosts
ssh-keygen
cat /home/ubuntu/.ssh/id_rsa.pub

echo "Ansible installation completed!"