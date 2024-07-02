#!/bin/bash

# Install Nexus Repository Manager
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y openjdk-11-jdk wget
elif command -v yum > /dev/null; then
    sudo yum update
    sudo yum install -y java-11-openjdk wget
elif command -v dnf > /dev/null; then
    sudo dnf update
    sudo dnf install -y java-11-openjdk wget
else
    echo "Unsupported package manager"
    exit 1
fi

# Create a Nexus user
sudo useradd -M -d /opt/nexus -s /bin/bash nexus

# Download and install Nexus
sudo mkdir /opt/nexus
sudo mkdir /opt/sonatype-work
cd /opt/nexus
sudo wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
sudo tar -zxvf latest-unix.tar.gz --strip-components=1
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work

# Configure Nexus to run as a service
echo 'run_as_user="nexus"' | sudo tee /opt/nexus/bin/nexus.rc
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
sudo systemctl enable nexus
sudo systemctl start nexus

echo "Nexus installation completed!"