#!/bin/bash
curl -L -o nightly_latest.tar.bz2  "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"
sudo cp /usr/share/applications/firefox.desktop /usr/share/applications/nightly_firefox.desktop
sudo apt remove firefox
sudo tar -jxf nightly_latest.tar.bz2 -C /opt
sudo ln -s /opt/firefox/firefox /usr/bin/firefox
sudo chmod 775 -R /opt/firefox
rm nightly_latest.tar.bz2
