#!/bin/bash

# Installations (should run before the apply.sh)
sudo apt update
sudo apt-get update

# Command line stuff
sudo apt install software-properties-common
sudo apt install vim
sudo apt install vim-gui-common
sudo apt install git
sudo apt install curl
sudo apt install xclip
sudo apt install feh
sudo apt install highlight
sudo apt install tmux

# stterm / xwindow
sudo apt install xorg openbox xauth
sudo apt install libx11-dev
sudo apt install libxft-dev

# Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg-agent     software-properties-common
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo apt install docker-compose

# i3
sudo apt install i3
sudo apt install compton
sudo apt install arandr

# YouCompleteMe Dependencies
sudo apt install build-essential cmake python3-dev

# Exuberant ctags
sudo apt install exuberant-ctags

# Python pip
sudo apt install python-pip python3-pip

#install vimplug - then run the :PluginInstall command
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Vim temporary directories
mkdir -p $HOME/.vim/tmp/.backup $HOME/.vim/tmp/.swp $HOME/.vim/tmp/.undo

mkdir $HOME/tmp
