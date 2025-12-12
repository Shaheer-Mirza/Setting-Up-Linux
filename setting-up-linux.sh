#!/bin/bash

sudo apt update && sudo apt full-upgrade -y


cd ~/Downloads

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt install ./google-chrome-stable_current_amd64.deb -y

wget https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb

sudo apt install ./freedownloadmanager.deb -y

git clone https://github.com/meowcateatrat/elephant.git

cd elephant/build
chmod +x build-unix.sh
./build-unix.sh

cp elephant.fda ~/Downloads/

cd ~/Downloads



