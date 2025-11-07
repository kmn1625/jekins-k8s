#!/bin/bash
# 1) Prereqs
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

# 2) Add the k8s repo key (adjust v1.34 to your desired minor if needed)
sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.34/deb/Release.key \
  | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# 3) Add the repo
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.34/deb/ /' \
  | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list

# 4) Install kubectl
sudo apt-get update
sudo apt-get install -y kubectl

# 5) Verify
kubectl version --client
