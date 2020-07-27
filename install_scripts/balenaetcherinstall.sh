#!/bin/bash

# Install balena etcher for flashing drives

curl -sSL https://github.com/balena-io/etcher/releases/download/v1.5.89/balena-etcher-electron-1.5.89-linux-x64.zip > ~/Downloads/balena-etcher-electron-1.5.89-linux-x64.zip
cd ~/Downloads/
unzip balena-etcher-electron-1.5.89-linux-x64.zip
sudo mv balenaEtcher-1.5.89-linux-x64.AppImage /opt/
sudo /opt/balenaEtcher-1.5.89-linux-x64.AppImage

