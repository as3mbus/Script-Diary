#!/bin/bash
sudo cp /usr/share/applications/firefox.desktop /usr/share/applications/nightly_firefox.desktop
sudo apt remove firefox
curl -L -o nightly_latest.tar.bz2  "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"
sudo tar -jxf nightly_latest.tar.bz2 -C /opt
sudo ln -s /opt/firefox/firefox /usr/bin/firefox
rm nightly_latest.tar.bz2
