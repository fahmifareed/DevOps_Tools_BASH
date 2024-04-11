#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' 

# Personal details
AUTHOR_NAME="Fahmi Fareed"
LINKEDIN="https://linkedin.com/in/fahmifareed"
GITHUB="https://github.com/fahmifareed"

# Print function with color
print_with_color() {
    echo -e "${!1}${2}${NC}"
}

# Function to display personal details
show_details() {
    print_with_color BLUE "Script created by: $AUTHOR_NAME"
    print_with_color BLUE "LinkedIn: $LINKEDIN"
    print_with_color BLUE "GitHub: $GITHUB"
    echo "--------------------------------------------------"
}

# Example installation function for Git
install_git() {
    print_with_color GREEN "Installing Git..."
    sudo apt-get update && sudo apt-get install -y git
    print_with_color GREEN "Git installed successfully."
}

install_java() {
    print_with_color GREEN "Installing Java..."
    sudo apt-get update && sudo apt-get install -y default-jdk
    print_with_color GREEN "Java installed successfully."
}

install_maven() {
    print_with_color GREEN "Installing Maven..."
    sudo apt-get update && sudo apt-get install -y maven
    print_with_color GREEN "Maven installed successfully."
}

install_grafana() {
    print_with_color GREEN "Installing Grafana..."
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
    wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
    sudo apt-get update && sudo apt-get install -y grafana
    print_with_color GREEN "Grafana installed successfully."
}

install_docker() {
    print_with_color GREEN "Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    print_with_color GREEN "Docker installed successfully."
}

install_jenkins() {
    print_with_color GREEN "Installing Jenkins..."
    sudo apt-get update && sudo apt-get install -y wget
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
    sudo apt-get update && sudo apt-get install -y jenkins
    print_with_color GREEN "Jenkins installed successfully."
}

install_jfrog_artifactory() {
    print_with_color GREEN "Installing JFrog Artifactory..."
    sudo apt-get update && sudo apt-get install -y docker.io
    docker run --name artifactory -d -p 8081:8081 docker.bintray.io/jfrog/artifactory-oss:latest
    print_with_color GREEN "JFrog Artifactory installed successfully."
}

install_tomcat() {
    print_with_color GREEN "Installing Tomcat..."
    sudo apt-get update && sudo apt-get install -y tomcat9 tomcat9-admin
    print_with_color GREEN "Tomcat installed successfully."
}

install_ansible() {
    print_with_color GREEN "Installing Ansible..."
    sudo apt-get update && sudo apt-get install -y ansible
    print_with_color GREEN "Ansible installed successfully."
}

install_terraform() {
    print_with_color GREEN "Installing Terraform..."
    sudo apt-get update && sudo apt-get install -y software-properties-common
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update && sudo apt-get install -y terraform
    print_with_color GREEN "Terraform installed successfully."
}

install_sonarqube() {
    print_with_color GREEN "Installing SonarQube..."
    sudo apt-get update && sudo apt-get install -y docker.io
    docker run -d --name sonarqube -p 9000:9000 sonarqube
    print_with_color GREEN "SonarQube installed successfully."
}

install_prometheus() {
    print_with_color GREEN "Installing Prometheus..."
    sudo apt-get update && sudo apt-get install -y docker.io
    docker run -d --name prometheus -p 9090:9090 prom/prometheus
    print_with_color GREEN "Prometheus installed successfully."
}

install_node_exporter() {
    print_with_color GREEN "Installing Node Exporter..."
    sudo apt-get update && sudo apt-get install -y docker.io
    docker run -d --name node_exporter -p 9100:9100 prom/node-exporter
    print_with_color GREEN "Node Exporter installed successfully."
}

install_kubernetes() {
    print_with_color GREEN "Installing Kubernetes..."
    sudo apt-get update && sudo apt-get install -y docker.io
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    print_with_color GREEN "Kubernetes installed successfully."
}

# Function to display the main menu
show_menu() {
    clear
    show_details
    print_with_color YELLOW "********** DevOps Tools Installer **********"
    print_with_color BLUE "Select the tool to install:"
    print_with_color RED "1) Git"
    print_with_color RED "2) Java"
    print_with_color RED "3) Maven"
    print_with_color RED "4) Grafana"
    print_with_color RED "5) Docker"
    print_with_color RED "6) Jenkins"
    print_with_color RED "7) JFrog Artifactory"
    print_with_color RED "8) Tomcat"
    print_with_color RED "9) Ansible"
    print_with_color RED "10) Terraform"
    print_with_color RED "11) SonarQube"
    print_with_color RED "12) Prometheus"
    print_with_color RED "13) Node Exporter"
    print_with_color RED "14) Kubernetes"
    print_with_color RED "0) Quit"
    print_with_color BLUE "Enter your choice: "
}

# Main loop
while true; do
    show_menu
    read choice
    case $choice in
        1)
            install_git
            ;;
        2)
            install_java
            ;;
        3)
            install_maven
            ;;
        4)
            install_grafana
            ;;
        5)
            install_docker
            ;;
        6)
            install_jenkins
            ;;
        7)
            install_jfrog_artifactory
            ;;
        8)
            install_tomcat
            ;;
        9)
            install_ansible
            ;;
        10)
            install_terraform
            ;;
        11)
            install_sonarqube
            ;;
        12)
            install_prometheus
            ;;
        13)
            install_node_exporter
            ;;
        14)
            install_kubernetes
            ;;
        0)
            print_with_color GREEN "Exiting installer. Goodbye!"
            break
            ;;
        *)
            print_with_color RED "Invalid option. Please select a valid number."
            ;;
    esac
    print_with_color YELLOW "Press any key to return to the menu..."
    read -n 1
done
