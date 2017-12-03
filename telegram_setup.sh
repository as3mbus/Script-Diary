#!/bin/bash
curl -L -o telegram.tar.xz "https://telegram.org/dl/desktop/linux"
sudo tar xf telegram.tar.xz -C /opt
sudo ln -s /opt/Telegram/Telegram /usr/bin/Telegram
rm telegram.tar.xz
Telegram
