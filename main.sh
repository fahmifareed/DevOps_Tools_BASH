#!/bin/bash

# Detect the package manager
if command -v apt-get > /dev/null; then
    PKG_MANAGER="apt-get"
    UPDATE_CMD="sudo apt-get update"
    INSTALL_CMD="sudo apt-get install -y"
    ADD_REPO_CMD="sudo apt-add-repository"
    PKG_UPDATE_CMD="sudo apt-get update"
elif command -v yum > /dev/null; then
    PKG_MANAGER="yum"
    UPDATE_CMD="sudo yum update"
    INSTALL_CMD="sudo yum install -y"
    ADD_REPO_CMD="sudo yum-config-manager --add-repo"
    PKG_UPDATE_CMD="sudo yum update"
elif command -v dnf > /dev/null; then
    PKG_MANAGER="dnf"
    UPDATE_CMD="sudo dnf update"
    INSTALL_CMD="sudo dnf install -y"
    ADD_REPO_CMD="sudo dnf config-manager --add-repo"
    PKG_UPDATE_CMD="sudo dnf update"
else
    echo "Unsupported package manager"
    exit 1
fi

# Function to install GIT
install_git() {
    $UPDATE_CMD
    $INSTALL_CMD git
    git --version
    which git
    git init
    ls -a
}

# Function to install Jenkins
install_jenkins() {
    $INSTALL_CMD java-11-openjdk-devel
    if [[ $PKG_MANAGER == "apt-get" ]]; then
        sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
        echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
    else
        sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
        sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    fi
    $PKG_UPDATE_CMD
    $INSTALL_CMD jenkins
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
    sudo systemctl status jenkins
}

# Function to install Maven
install_maven() {
    $INSTALL_CMD java-11-openjdk-devel
    $INSTALL_CMD maven
    mvn --version
    mvn archetype:generate
    $INSTALL_CMD tree
}

# Function to install Docker
install_docker() {
    $UPDATE_CMD
    $INSTALL_CMD docker
    docker --version
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo systemctl status docker
}

# Function to install Docker Compose
install_docker_compose() {
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version
}

# Function to install Terraform
install_terraform() {
    $UPDATE_CMD
    $INSTALL_CMD software-properties-common gnupg2 curl
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    if [[ $PKG_MANAGER == "apt-get" ]]; then
        $ADD_REPO_CMD "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    else
        sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    fi
    $PKG_UPDATE_CMD
    $INSTALL_CMD terraform
    terraform --version
}

# Function to install Ansible
install_ansible() {
    $UPDATE_CMD
    $INSTALL_CMD ansible
    cd /etc/ansible
    ls
    vi hosts
    ssh-keygen
    cat /home/ubuntu/.ssh/id_rsa.pub
}

# Function to install Kubernetes
install_kubernetes() {
    $UPDATE_CMD
    $INSTALL_CMD docker
    sudo service docker restart
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    if [[ $PKG_MANAGER == "apt-get" ]]; then
        echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    else
        cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
        https://packages.cloud.google.com/yum/doc/yum-key.gpg
EOF
    fi
    $PKG_UPDATE_CMD
    $INSTALL_CMD kubeadm kubectl kubelet
    sudo kubeadm init --pod-network-cidr=192.168.0.0/16
    exit
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
    kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.49.0/deploy/static/provider/baremetal/deploy.yaml
}

# Run all installation functions
install_git
install_jenkins
install_maven
install_docker
install_docker_compose
install_terraform
install_ansible
install_kubernetes

echo "All tools installed successfully!"