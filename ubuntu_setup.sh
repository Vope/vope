#!/bin/bash
apt update
apt upgrade -y

apt install vim -y

# Google Chrome
wget -O google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome.deb
rm google-chrome.deb

# Postman
snap install postman

# Jetbrains Toolbox
wget -O jetbrains-toolbox.tar.gz https://download-cf.jetbrains.com/toolbox/jetbrains-toolbox-1.17.7139.tar.gz
sudo -u vope tar -xf jetbrains-toolbox.tar.gz -C /home/vope/
rm jetbrains-toolbox.tar.gz

# Telegram
wget -O telegram.tar.xz https://updates.tdesktop.com/tlinux/tsetup.2.1.13.tar.xz
sudo -u vope tar -xf telegram.tar.xz -C /home/vope/
rm telegram.tar.xz

# Docker
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt update
apt install -y docker-ce docker-ce-cli containerd.io
groupadd docker
usermod -aG docker vope
docker --version

# Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

apt autoremove
sudo -u vope mkdir /home/vope/projects

sudo -u vope git config --global user.name "Andrew Ryabov"
sudo -u vope git config --global user.email "$1"
sudo -u vope git config --global core.editor vim

reboot
