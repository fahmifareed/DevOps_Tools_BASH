#!/bin/bash

# Install Helm
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y apt-transport-https
    curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
    sudo apt-add-repository "deb https://baltocdn.com/helm/stable/debian/ all main"
    sudo apt-get update
    sudo apt-get install -y helm
elif command -v yum > /dev/null; then
    sudo yum update
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://baltocdn.com/helm/stable/rpm/helm.repo
    sudo yum install -y helm
elif command -v dnf > /dev/null; then
    sudo dnf update
    sudo dnf install -y dnf-plugins-core
    sudo dnf config-manager --add-repo https://baltocdn.com/helm/stable/rpm/helm.repo
    sudo dnf install -y helm
else
    echo "Unsupported package manager"
    exit 1
fi

# Verify installation
helm version

echo "Helm installation completed!"