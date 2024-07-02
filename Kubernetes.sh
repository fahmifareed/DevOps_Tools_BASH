#!/bin/bash

# Update package list and install Kubernetes
if command -v apt-get > /dev/null; then
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo service docker restart
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00
elif command -v yum > /dev/null; then
    sudo yum install -y docker
    sudo systemctl restart docker
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
    sudo yum install -y kubeadm kubectl kubelet
elif command -v dnf > /dev/null; then
    sudo dnf install -y docker
    sudo systemctl restart docker
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
    sudo dnf install -y kubeadm kubectl kubelet
else
    echo "Unsupported package manager"
    exit 1
fi

# Initialize Kubernetes cluster
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
exit
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Apply network plugin and ingress controller
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.49.0/deploy/static/provider/baremetal/deploy.yaml

echo "Kubernetes installation completed!"