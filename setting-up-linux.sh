#!/bin/bash

sudo apt update && sudo apt full-upgrade -y


cd ~/Downloads

#install google chrome

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

#Install FDM

wget https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb
sudo apt install ./freedownloadmanager.deb -y

#Install elephant add on on fdm

git clone https://github.com/meowcateatrat/elephant.git
cd elephant/build
chmod +x build-unix.sh
./build-unix.sh
cp elephant.fda ~/Downloads/
cd ~/Downloads

#Lid Close Action

sudo sh -c 'printf "HandleLidSwitch=ignore\nHandleLidSwitchExternalPower=ignore\nHandleLidSwitchDocked=ignore\n" >> /etc/systemd/logind.conf'
sudo systemctl restart systemd-logind

#install snap

sudo apt install snapd
sudo systemctl enable snapd.apparmor.service

#Install Flathub

sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
sudo apt install plasma-discover-backend-flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#Install OBS Studio
flatpak install flathub com.obsproject.Studio


#Installing Warp
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ bullseye main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt-get update && sudo apt-get install cloudflare-warp -y
