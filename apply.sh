#!/bin/bash

# Apply configurations script (run after install.sh)

new_backup () {
  proj="$HOME/dotfiles_backup";
  ver="backup";
  if [ -z "$1" ]; then
    i=1;
  else
    i="$1";
  fi
  stringa="$proj/$ver$i";

  if [ ! -d "$stringa" ]; then
    mkdir -p "$stringa";
    echo "$stringa";
  else
    new_backup "$(($i+1))";
  fi
}

# Set backup folder and dotfiles folder
DBF="$(new_backup)";
DF="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";

apply_dot () {
  file=`basename $1`
  filePath=`dirname $1`
  backupFolder="$DBF/$2"
  mkdir -v $backupFolder
  mv -v $1 $backupFolder
  ln -sv $DF/$2/$file $filePath
}

# misc
apply_dot ~/.fonts .

# i3
apply_dot ~/.config/i3 .
apply_dot ~/.i3status.conf i3

# vim
apply_dot ~/.vim/colors vim
apply_dot ~/.vim/snippets vim
apply_dot ~/.vimrc vim

# bash
apply_dot ~/.bash_aliases bash
apply_dot ~/.bash_functions bash
apply_dot ~/.bashrc bash
apply_dot ~/.inputrc bash
apply_dot ~/.profile bash

# x_window_system
apply_dot ~/.xmodmaprc x_window_system
apply_dot ~/.Xresources x_window_system
apply_dot ~/.xsessionrc x_window_system

# bin
apply_dot ~/bin .

# tmux
apply_dot ~/.tmux.conf .

# src
apply_dot ~/src .

# my_repositories
apply_dot ~/.myrepos .

# Apply custom keys settings
xmodmap ~/.xmodmaprc

# Apply Xresources
xrdb ~/.Xresources

