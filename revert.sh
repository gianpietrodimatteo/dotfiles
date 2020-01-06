#!/bin/bash

# Revert configurations to their previous state

select_backup () {
  echo "Select backup to restore to:";
  select folder in `ls $HOME/dotfiles_backup`; do
    if [ ! -z "$folder" ]; then
      echo "$folder";
      break
    fi
  done
}

# Set backup folder and dotfiles folder
DBF="$HOME/dotfiles_backup/$(select_backup)";
DF="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";

revert_bkp () {
  file=`basename $1`
  filePath=`dirname $1`
  cp -v $DBF/$2/$file $filePath
}

# misc
revert_bkp ~/.fonts .

# i3
revert_bkp ~/.config/i3 .
revert_bkp ~/.i3status.conf i3

# vim
revert_bkp ~/.vim/colors vim
revert_bkp ~/.vim/snippets vim
revert_bkp ~/.vimrc vim

# bash
revert_bkp ~/.bash_aliases bash
revert_bkp ~/.bash_functions bash
revert_bkp ~/.bashrc bash
revert_bkp ~/.inputrc bash
revert_bkp ~/.profile bash
revert_bkp ~/.bash_variables bash
revert_bkp ~/.bash_custom bash

# x_window_system
revert_bkp ~/.xmodmaprc x_window_system
revert_bkp ~/.Xresources x_window_system
revert_bkp ~/.xsessionrc x_window_system

# bin
revert_bkp /bin .

# tmux
revert_bkp ~/.tmux.conf .

# src
revert_bkp ~/src .

# my_repositories
revert_bkp ~/.myrepos .

# Apply custom keys settings
xmodmap ~/.xmodmaprc

# Apply Xresources
xrdb ~/.Xresources


