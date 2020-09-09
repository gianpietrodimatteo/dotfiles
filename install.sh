#!/bin/bash

# Installations (should run before the apply.sh)

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Command line stuff
sudo apt install software-properties-common
sudo apt install git
sudo apt install curl
sudo apt install xclip
sudo apt install feh
sudo apt install imagemagick
sudo apt install highlight
sudo apt install tree
sudo apt install xbacklight
sudo apt install xinput
sudo apt install gnuplot
sudo apt install locate
sudo apt install unrar-free
sudo apt install playerctl
sudo apt install jq
sudo apt install expect
sudo apt install openvpn
sudo apt install p7zip p7zip-full


brew install vim

# Install macvim
brew install cmake macvim
brew link --overwrite macvim

# Python pip
sudo apt install python-pip python3-pip

# Vim temporary directories
mkdir -p $HOME/.vim/tmp/{.backup,.swp,.undo}

mkdir -p $HOME/tmp
ln -sv /opt $HOME/Applications

# vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Package managed
sudo apt install snapd
sudo snap install dbeaver-ce
sudo snap install spotify
sudo snap install vlc
sudo snap install --classic heroku

sudo snap install retroarch

# Misc software
sudo apt install calibre
sudo apt install cheese
sudo apt install gtk-recordmydesktop
sudo apt install kdenlive
sudo apt install audacity
sudo apt install gimp

# Chrome, IDEs, deb packages

echo "Missing:"
echo "chrome"
echo "vscode"
echo "dropbox"
echo "google cloud"


echo "chrome"
echo "chrome"
echo "chrome"
echo "chrome"

# nvm and node
cd ~ && wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
command -v nvm # check installation
nvm install node # latest
# npm installations
npm -g install typescript
npm -g install prettier

# yarn
cd ~/Downloads && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn

# docker
bash install_scripts/dockerinstall.sh

# mysql
bash install_scripts/mysqlinstall.sh

# tmux
bash install_scripts/tmuxinstall.sh

# mongodb
bash install_scripts/mongoinstall.sh

# Kodi
bash install_scripts/kodiinstall.sh

# Etcher
bash install_scripts/balenaetcherinstall.sh

###############################################################################
# Apply configuration
bash apply.sh

# Post environment variables installations: These must come after apply.sh
echo "Starting post configuration installations."
mkdir -p "$WORKSPACE"

###############################################################################

# Install vim
bash install_scripts/viminstall.sh

# Install st
bash install_scripts/stinstall.sh

# Golang
bash install_scripts/goinstall.sh

###############################################################################
# manual installations...TODO make it all automatic - thanks oracle
echo "Install by hand: "
echo "java eclipse intellij"

echo "mongod compass"
echo "steam"
echo "inkscape"
