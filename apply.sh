#!/bin/bash

# Apply configurations script (run after install.sh)

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

# atom
applyDot ~/.atom/config.cson atom

# vim
applyDot ~/.vim/colors vim
applyDot ~/.vim/snippets vim
applyDot ~/.vimrc vim

# ranger
applyDot ~/.config/ranger/rc.conf ranger

# bash
applyDot ~/.bash_aliases bash
applyDot ~/.bash_functions bash
applyDot ~/.bashrc bash
applyDot ~/.inputrc bash
applyDot ~/.profile bash

