#!/bin/bash

# Installations (should run before the apply.sh)
sudo apt update
sudo apt-get update

# Tools
sudo apt-get install build-essential

# Install ranger
sudo apt-get install ranger

# YouCompleteMe Dependencies
sudo apt install build-essential cmake python3-dev

# Exuberant ctags
sudo apt install exuberant-ctags

# copy rangers default config
ranger --copy-config=all

# Python pip
sudo apt install python-pip python3-pip

# Command line stuff
sudo apt install xclip
sudo apt install w3m w3m-img
sudo apt install ffmpegthumbnailer

# Ueberzug dependencies
sudo apt install libxtst libjpeg-dev zlib1g-dev
# Ueberzug
sudo pip3 install ueberzug


#install vimplug - then run the :PluginInstall command
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Vim temporary directories
mkdir -p $HOME/.vim/tmp/.backup $HOME/.vim/tmp/.swp $HOME/.vim/tmp/.undo
