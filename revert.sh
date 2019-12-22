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

# vim
revertBkp ~/.vim/colors vim
revertBkp ~/.vim/snippets vim
revertBkp ~/.vimrc vim

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

# bin
revertBkp /bin .

# tmux
revertBkp ~/.tmux.conf .

# src
revertBkp ~/src .

# Apply custom keys settings
xmodmap ~/.xmodmaprc

# Apply Xresources
xrdb ~/.Xresources


