#!/bin/bash

# Install Kibana
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y apt-transport-https
    sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
    sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'
    sudo apt-get update
    sudo apt-get install -y kibana
elif command -v yum > /dev/null; then
    sudo yum update
    sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
    sudo cat <<EOF | sudo tee /etc/yum.repos.d/kibana.repo
[kibana-7.x]
name=Kibana repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
    sudo yum install -y kibana
elif command -v dnf > /dev/null; then
    sudo dnf update
    sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
    sudo cat <<EOF | sudo tee /etc/yum.repos.d/kibana.repo
[kibana-7.x]
name=Kibana repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
    sudo dnf install -y kibana
else
    echo "Unsupported package manager"
    exit 1
fi

# Enable and start Kibana
sudo systemctl daemon-reload
sudo systemctl enable kibana
sudo systemctl start kibana

echo "Kibana installation completed!"