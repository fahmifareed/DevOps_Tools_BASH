#!/bin/bash

# Install Grafana
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
    sudo wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install -y grafana
elif command -v yum > /dev/null; then
    sudo yum update
    sudo yum install -y initscripts fontconfig
    sudo rpm --import https://packages.grafana.com/gpg.key
    sudo cat <<EOF | sudo tee /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF
    sudo yum install -y grafana
elif command -v dnf > /dev/null; then
    sudo dnf install -y initscripts fontconfig
    sudo rpm --import https://packages.grafana.com/gpg.key
    sudo cat <<EOF | sudo tee /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF
    sudo dnf install -y grafana
else
    echo "Unsupported package manager"
    exit 1
fi

# Enable and start Grafana
sudo systemctl daemon-reload
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

echo "Grafana installation completed!"