#!/bin/bash

sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-prime nvidia-384
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo apt install bumblebee bumblebee-nvidia primus bbswitch-dkms
sudo prime-select intel
sudo apt upgrade
curl -L -o prime-indicator-master.zip  "https://github.com/andrebrait/prime-indicator/archive/master.zip"
unzip prime-indicator-master.zip
cd prime-indicator-master
sudo chmod +x setup.sh
sudo ./setup.sh
curl -L -o small-icons.zip  "https://github.com/andrebrait/prime-indicator/files/591779/small-icons.zip"
unzip small-icons.zip -d /usr/lib/prime-indicator/icons
