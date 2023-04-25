# k8s-local-setup

Kubernetes local environment for testing purposes, not for production uses.

Based on [VirtualizationHowto's](https://www.youtube.com/@VirtualizationHowto) [Build a Kubernetes Home Lab from Scratch step-by-step!](https://youtu.be/_WW16Sp8-Jw) tutorial.

## Requirements
- 3+ Ubuntu 20.04 VMs (22.04 not supported)
- Internal LAN with internet access for VMs (NAT Network is recommended)

## Installation
1. Git clone this repo.
2. Run `setup.sh` on each one of the VMs.
3. Run `master-init.sh` on master node.
4. Enjoy!
