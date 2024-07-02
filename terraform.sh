#!/bin/bash

# Update package list and install Terraform
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y software-properties-common gnupg2 curl
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update
    sudo apt-get install -y terraform
elif command -v yum > /dev/null; then
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    sudo yum install -y terraform
elif command -v dnf > /dev/null; then
    sudo dnf install -y dnf-plugins-core
    sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    sudo dnf install -y terraform
else
    echo "Unsupported package manager"
    exit 1
fi

# Verify installation
terraform --version

echo "Terraform installation completed!"