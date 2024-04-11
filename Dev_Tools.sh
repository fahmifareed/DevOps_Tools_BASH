#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' 

# Personal details
NAME="Fahmi Fareed"
LINKEDIN_USERNAME="fahmifareed"
GITHUB_USERNAME="fahmifareed"

# Function to install Docker
install_docker() {
    echo -e "${GREEN}Installing Docker...${NC}"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    echo -e "${GREEN}Docker installed successfully.${NC}"
}

# Function to install Kubernetes
install_kubernetes() {
    echo -e "${GREEN}Installing Kubernetes (Minikube)...${NC}"
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    echo -e "${GREEN}Kubernetes (Minikube) installed successfully.${NC}"
}

# Function to install Jenkins
install_jenkins() {
    echo -e "${GREEN}Installing Jenkins...${NC}"
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt-get update
    sudo apt-get install jenkins -y
    echo -e "${GREEN}Jenkins installed successfully.${NC}"
}

# Function to install Git
install_git() {
    echo -e "${GREEN}Installing Git...${NC}"
    sudo apt-get update && sudo apt-get install git -y
    echo -e "${GREEN}Git installed successfully.${NC}"
}

# Function to install Gradle
install_gradle() {
    echo -e "${GREEN}Installing Gradle...${NC}"
    sudo apt-get update && sudo apt-get install gradle -y
    echo -e "${GREEN}Gradle installed successfully.${NC}"
}

# Function to install Maven
install_maven() {
    echo -e "${GREEN}Installing Apache Maven...${NC}"
    sudo apt-get update && sudo apt-get install maven -y
    echo -e "${GREEN}Apache Maven installed successfully.${NC}"
}

# Function to install Terraform
install_terraform() {
    echo -e "${GREEN}Installing Terraform...${NC}"
    sudo apt-get update && sudo apt-get install terraform -y
    echo -e "${GREEN}Terraform installed successfully.${NC}"
}

# Main menu for installation script
show_menu() {
    echo -e "${YELLOW}******************** DevOps Tools Installation ********************${NC}"
    echo -e "Welcome, ${BLUE}${NAME}${NC}. Your LinkedIn and GitHub username: ${GREEN}${LINKEDIN_USERNAME}${NC}"
    echo -e "${BLUE}Select the tool you want to install or setup:${NC}"
    echo -e "${RED}1)${NC} Docker"
    echo -e "${RED}2)${NC} Kubernetes (Minikube)"
    echo -e "${RED}3)${NC} Jenkins"
    echo -e "${RED}4)${NC} Git"
    echo -e "${RED}5)${NC} Gradle"
    echo -e "${RED}6)${NC} Apache Maven"
    echo -e "${RED}7)${NC} Terraform"
    echo -e "${RED}8)${NC} Exit"
    echo -e "${BLUE}Enter your choice (1-8): ${NC}"
}

while true; do
    show_menu
    read choice
    case $choice in
        1) install_docker ;;
        2) install_kubernetes ;;
        3) install_jenkins ;;
        4) install_git ;;
        5) install_gradle ;;
        6) install_maven ;;
        7) install_terraform ;;
        8) echo -e "${YELLOW}Exiting script. Goodbye, ${NAME}.${NC}"; break ;;
        *) echo -e "${RED}Invalid option. Please select a number between 1 and 8.${NC}" ;;
    esac
    echo -e "${YELLOW}Press any key to return to the menu...${NC}"
    read -n 1
done
