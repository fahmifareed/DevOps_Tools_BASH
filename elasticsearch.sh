#!/bin/bash

# Install Elasticsearch
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y apt-transport-https
    sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
    sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'
    sudo apt-get update
    sudo apt-get install -y elasticsearch
elif command -v yum > /dev/null; then
    sudo yum update
    sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
    sudo cat <<EOF | sudo tee /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
    sudo yum install -y elasticsearch
elif command -v dnf > /dev/null; then
    sudo dnf update
    sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
    sudo cat <<EOF | sudo tee /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
    sudo dnf install -y elasticsearch
else
    echo "Unsupported package manager"
    exit 1
fi

# Enable and start Elasticsearch
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch

echo "Elasticsearch installation completed!"