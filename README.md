### DevOps Tools Installation Script
## Overview
# ***This script automates the installation of several popular DevOps tools on Ubuntu servers. It's designed to help DevOps engineers quickly set up a new environment with all necessary tools available.***

## Requirements:
Ubuntu Linux (The script checks for Ubuntu and proceeds with installation only if it's detected).
Internet connection (for downloading packages).
Sudo privileges.
## Usage :
,,,
Ensure you have sudo privileges and your system is updated.
Download the script to your Ubuntu server.
Make the script executable: chmod +x devops_tools.sh.
Run the script: ./devops_tools.sh.
Follow the on-screen prompts to select and install the tools.
,,,
## Supported Tools :
[]Git: Version control system designed to handle everything from small to very large projects with speed and efficiency.
[]Java: Necessary for running applications developed in Java.
[]Maven: Build automation tool used primarily for Java projects.
[]Grafana: Analytics & monitoring solution.
[]Docker: Platform for developing, shipping, and running applications.
[]Jenkins: Automation server used to automate all sorts of tasks related to building, testing, and delivering or deploying software.
[]JFrog Artifactory: Artifact repository manager.
[]Tomcat: Application Server used to deploy Java Servlets and JSPs.
[]Ansible: Software tool that provides simple but powerful automation for cross-platform computer support.
[]Terraform: Infrastructure as code software by HashiCorp.
[]SonarQube: Automatic code review tool to detect bugs, vulnerabilities, and code smells in your code.
[]Prometheus: Monitoring and alerting toolkit.
[]Node Exporter: Prometheus exporter for hardware and OS metrics exposed by *NIX kernels.
[]Kubernetes: Open-source system for automating deployment, scaling, and management of containerized applications.
# Contact Information :
FAHMI FAREED 🐳 DevOps Engineer
E-mail: info@fahmi.xyz
Please note, this script must be executed on an Ubuntu server as it utilizes the apt package manager for installations. Each tool's installation includes a verification step to check if the tool is already installed, ensuring that existing setups are not overwritten.
