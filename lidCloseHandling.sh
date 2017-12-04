#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if [[ $1 = manager ]]; then
	echo manager
	sudo sed -i '/HandleLidSwitch=ignore/d' /etc/systemd/logind.conf
elif [[ $1 = ignore ]]; then
	echo ignore
	sudo echo "HandleLidSwitch=ignore" >> /etc/systemd/logind.conf
fi
sudo service systemd-logind restart
