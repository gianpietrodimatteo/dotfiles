#!/bin/bash

#install ranger
sudo apt-get update
sudo apt-get install ranger

# copy rangers default config
ranger --copy-config=all

#install vimplug - then run the :PluginInstall command
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Vim temporary directories
mkdir -p $HOME/.vim/tmp/.backup $HOME/.vim/tmp/.swp $HOME/.vim/tmp/.undo

# backup folder and dotfiles folder
DBF="$HOME/dotfiles_backup"
DF="$HOME/dotfiles"

rm -r $DBF
mkdir $DBF

applyDot(){
	file=`basename $1`
	filePath=`dirname $1`
	backupFolder="$DBF/$2"
	mkdir -v $backupFolder
	mv -v $1 $backupFolder
        ln -sv $DF/$2/$file $filePath
}

# misc
applyDot ~/.fonts .

# i3
applyDot ~/.config/i3 .
applyDot ~/.i3status.conf i3

# atom
applyDot ~/.atom/config.cson atom

# vim
applyDot ~/.vim/colors vim
applyDot ~/.vim/snippets vim
applyDot ~/.vimrc vim

# bash
applyDot ~/.bash_aliases bash
applyDot ~/.bash_functions bash
applyDot ~/.bashrc bash
applyDot ~/.inputrc bash
applyDot ~/.profile bash

# x_window_system
applyDot ~/.xmodmaprc x_window_system
applyDot ~/.Xresources x_window_system
applyDot ~/.xsessionrc x_window_system

# DEBIAN: Apply multimedia keys settings
xmodmap ~/.xmodmaprc

xrdb ~/.Xresources
