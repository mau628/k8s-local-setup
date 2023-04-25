#!/bin/bash
########################
echo "Disabling swap"
swapoff -a

search=\/swap.img
replace=#\/swap.img
filename=/etc/fstab
if [[ $search != "" && $replace != "" ]]; then
  sed -i "s=$search=$replace=" $filename
fi

########################
echo "Installing docker"
apt install docker.io -y

########################
echo "Installing cURL"
which curl &> /dev/null || apt install apt-transport-https curl -y

########################
echo "Adding repository key for Kubernetes"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add

########################
echo "Adding Kubernetes repository"
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main" -y
apt update

########################
echo "Install Kubernetes"
apt install kubeadm kubelet kubectl kubernetes-cni -y

########################
echo "Kubernetes installation complete!"
