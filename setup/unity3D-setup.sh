#!/bin/bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/ubuntu xenial main" | sudo tee /etc/apt/sources.list.d/mono-official.list
sudo apt-get update
sudo apt install monodevelop 

echo 'download latest unity 3d package here [https://forum.unity3d.com/threads/unity-on-linux-release-notes-and-known-issues.350256/]'
echo 'install it with [dpkg -i </package/path>] to make it more responsive (CLI wise)'
echo 'and also dont forget to [sudo apt install -f] it after installation complete'
