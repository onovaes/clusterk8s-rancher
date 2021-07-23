#!/usr/bin/env bash

#Set up the repository

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# INSTALL dOCKER
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io


#PERMISSION TO CURRENT USER RUN DOCKER (How to fix docker: Got permission denied issue)
sudo usermod -aG docker $USER
newgrp docker