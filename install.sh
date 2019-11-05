#!/bin/bash

# Installations (should run before the apply.sh)

# Install ranger
sudo apt-get update
sudo apt-get install ranger

# YouCompleteMe Dependencies
sudo apt install build-essential cmake python3-dev

# Exuberant ctags
sudo apt install exuberant-ctags

# copy rangers default config
ranger --copy-config=all

#install vimplug - then run the :PluginInstall command
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Vim temporary directories
mkdir -p $HOME/.vim/tmp/.backup $HOME/.vim/tmp/.swp $HOME/.vim/tmp/.undo
