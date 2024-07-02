# DevOps Tools Installation Guide

[![Ansible](https://img.shields.io/badge/Ansible-2.9.6-blue?logo=ansible)](https://www.ansible.com/)
[![Git](https://img.shields.io/badge/Git-2.25.1-orange?logo=git)](https://git-scm.com/)
[![Jenkins](https://img.shields.io/badge/Jenkins-2.289.3-blue?logo=jenkins)](https://www.jenkins.io/)
[![Maven](https://img.shields.io/badge/Maven-3.6.3-blue?logo=apache-maven)](https://maven.apache.org/)
[![Docker](https://img.shields.io/badge/Docker-20.10.7-blue?logo=docker)](https://www.docker.com/)
[![Terraform](https://img.shields.io/badge/Terraform-1.0.3-purple?logo=terraform)](https://www.terraform.io/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-1.21.0-blue?logo=kubernetes)](https://kubernetes.io/)
[![Nexus](https://img.shields.io/badge/Nexus-3.30.0-blue?logo=sonatype)](https://www.sonatype.com/nexus/repository-oss)
[![Grafana](https://img.shields.io/badge/Grafana-7.5.7-orange?logo=grafana)](https://grafana.com/)
[![Prometheus](https://img.shields.io/badge/Prometheus-2.30.0-orange?logo=prometheus)](https://prometheus.io/)
[![Elasticsearch](https://img.shields.io/badge/Elasticsearch-7.13.4-blue?logo=elasticsearch)](https://www.elastic.co/elasticsearch/)
[![Kibana](https://img.shields.io/badge/Kibana-7.13.4-blue?logo=kibana)](https://www.elastic.co/kibana/)
[![Helm](https://img.shields.io/badge/Helm-3.5.4-blue?logo=helm)](https://helm.sh/)
[![NGINX](https://img.shields.io/badge/NGINX-1.21.1-blue?logo=nginx)](https://www.nginx.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-13.3-blue?logo=postgresql)](https://www.postgresql.org/)
[![Redis](https://img.shields.io/badge/Redis-6.2.5-blue?logo=redis)](https://redis.io/)

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
- [Contribution](#contribution)
- [License](#license)

## Overview

This repository contains an Ansible playbook to automate the installation of essential DevOps tools on Linux systems. The tools included are:

- GIT
- Jenkins
- Maven
- Docker
- Docker Compose
- Terraform
- Ansible
- Kubernetes
- Nexus
- Grafana
- Prometheus
- Elasticsearch
- Kibana
- Helm
- NGINX
- PostgreSQL
- Redis

## Installation

### Prerequisites

- Ansible must be installed on your system. You can install Ansible using the following command:

    ```bash
    sudo apt update
    sudo apt install -y ansible
    ```

### Setup

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/devops-tools-installation.git
    cd devops-tools-installation
    ```

2. Run the Ansible playbook:

    ```bash
    ansible-playbook -i localhost, install_devops_tools.yml
    ```

## Usage

The playbook will install and configure all the tools listed. Each tool will be set up with its default configuration. You can customize the configuration by editing the Ansible roles and variables as needed.

## Contribution

Contributions are welcome! Please fork the repository and submit a pull request with your changes. Ensure that your code adheres to the existing style and includes relevant tests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.