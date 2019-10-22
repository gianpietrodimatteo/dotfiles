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

