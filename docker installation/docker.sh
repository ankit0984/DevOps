#!/bin/sh
sudo apt install gnome-terminal
sudo apt install ./docker-desktop-amd64.deb
sudo apt update
sudo systemctl daemon-reload
sudo apt update
sudo apt upgrade -y
sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
# docker installatin command
###################################################################
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
#####################################################################

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin  # install all essentaial files for docker and docker desktop

sudo docker run hello-world

sudo apt-get install ./docker-desktop-amd64.deb # docker desktop install

systemctl --user start docker-desktop  # start docker desktop or services
# post installation
docker login

gpg --generate-key
pass init public_id(e.g, 9F21C237128F7D42F7D333ABCB4B2CCAA9238514)
