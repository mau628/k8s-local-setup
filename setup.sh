#!/bin/bash
########################
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color
function printt(){
  echo -e "${ORANGE}Setup: ${GREEN}$1${NC}"
}
########################
printt "Disabling swap"
swapoff -a

search=\/swap.img
replace=#\/swap.img
filename=/etc/fstab
if [[ $search != "" && $replace != "" ]]; then
  sed -i "s=$search=$replace=" $filename
fi

########################
printt "Installing docker"
apt install docker.io -y

########################
printt "Installing cURL"
which curl &> /dev/null || apt install apt-transport-https curl -y

########################
printt "Adding repository key for Kubernetes"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add

########################
printt "Adding Kubernetes repository"
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main" -y
apt update

########################
printt "Install Kubernetes"
apt install kubeadm kubelet kubectl kubernetes-cni -y

########################
printt "Kubernetes installation complete!"
