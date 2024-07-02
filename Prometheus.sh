#!/bin/bash

# Install Prometheus
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y wget tar
elif command -v yum > /dev/null; then
    sudo yum update
    sudo yum install -y wget tar
elif command -v dnf > /dev/null; then
    sudo dnf update
    sudo dnf install -y wget tar
else
    echo "Unsupported package manager"
    exit 1
fi

# Download and install Prometheus
cd /tmp
wget https://github.com/prometheus/prometheus/releases/download/v2.30.0/prometheus-2.30.0.linux-amd64.tar.gz
tar -xvzf prometheus-2.30.0.linux-amd64.tar.gz
sudo mv prometheus-2.30.0.linux-amd64 /usr/local/prometheus
sudo ln -s /usr/local/prometheus/prometheus /usr/local/bin/prometheus
sudo ln -s /usr/local/prometheus/promtool /usr/local/bin/promtool

# Create a Prometheus service
sudo tee /etc/systemd/system/prometheus.service <<EOF
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=root
ExecStart=/usr/local/bin/prometheus --config.file /usr/local/prometheus/prometheus.yml --storage.tsdb.path /usr/local/prometheus/data

[Install]
WantedBy=multi-user.target
EOF

# Start Prometheus service
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus

echo "Prometheus installation completed!"