#!/bin/bash
########################
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color
function printt(){
  echo -e "${ORANGE}Setup: ${GREEN}$1${NC}"
}
########################
printt "Init Master Node"
kubeadm init

########################
printt "Setup kube config"
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

########################
printt "Master Node Init Complete!"