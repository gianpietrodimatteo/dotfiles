#!/bin/bash

# Docker installation
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg-agent     software-properties-common
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo apt install docker-compose

# Configuring permissions
sudo groupadd docker
sudo usermod -aG docker $USER

