#!/bin/bash

# Revert configurations to their previous state

# backup folder and dotfiles folder
DBF="$HOME/dotfiles_backup"
DF="$HOME/dotfiles"

revertBkp(){
	file=`basename $1`
	filePath=`dirname $1`
        cp -v $DBF/$2/$file $filePath
}

# misc
revertBkp ~/.fonts .

# i3
revertBkp ~/.config/i3 .
revertBkp ~/.i3status.conf i3

# atom
revertBkp ~/.atom/config.cson atom

# vim
revertBkp ~/.vim/colors vim
revertBkp ~/.vim/snippets vim
revertBkp ~/.vimrc vim

# ranger
revertBkp ~/.config/ranger/rc.conf ranger

# bash
revertBkp ~/.bash_aliases bash
revertBkp ~/.bash_functions bash
revertBkp ~/.bashrc bash
revertBkp ~/.inputrc bash
revertBkp ~/.profile bash

# x_window_system
revertBkp ~/.xmodmaprc x_window_system
revertBkp ~/.Xresources x_window_system
revertBkp ~/.xsessionrc x_window_system

# DEBIAN: Apply multimedia keys settings
xmodmap ~/.xmodmaprc

# Apply Xresources
xrdb ~/.Xresources
