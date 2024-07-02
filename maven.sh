#!/bin/bash

# Install OpenJDK 11 and Maven
if command -v apt-get > /dev/null; then
    sudo apt-get install -y openjdk-11-jdk maven tree
elif command -v yum > /dev/null; then
    sudo yum install -y java-11-openjdk-devel maven tree
elif command -v dnf > /dev/null; then
    sudo dnf install -y java-11-openjdk-devel maven tree
else
    echo "Unsupported package manager"
    exit 1
fi

# Verify Maven installation
mvn --version
mvn archetype:generate

echo "Maven installation completed!"