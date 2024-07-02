#!/bin/bash

# Install PostgreSQL
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y postgresql postgresql-contrib
elif command -v yum > /dev/null; then
    sudo yum update
    sudo yum install -y postgresql-server postgresql-contrib
    sudo postgresql-setup initdb
elif command -v dnf > /dev/null; then
    sudo dnf update
    sudo dnf install -y postgresql-server postgresql-contrib
    sudo postgresql-setup --initdb --unit postgresql
else
    echo "Unsupported package manager"
    exit 1
fi

# Enable and start PostgreSQL
sudo systemctl enable postgresql
sudo systemctl start postgresql

# Verify installation
psql --version

echo "PostgreSQL installation completed!"