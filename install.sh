#!/bin/bash

# Installations (should run before the apply.sh)

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install ranger
brew install ranger

brew install vim
# Install macvim
brew install cmake macvim
brew link --overwrite macvim

# copy rangers default config
ranger --copy-config=all

#install vimplug - then run the :PluginInstall command
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Vim temporary directories
mkdir -p $HOME/.vim/tmp/.backup $HOME/.vim/tmp/.swp $HOME/.vim/tmp/.undo
