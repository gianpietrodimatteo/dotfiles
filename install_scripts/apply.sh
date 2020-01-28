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

apply_dot_change () {
  new_file_name=`basename $1`
  filePath=`dirname $1`
  original_file_name="$3"
  backupFolder="$DBF/$2"
  mkdir -v $backupFolder
  mv -v $1 $backupFolder
  ln -sv $DF/$2/$original_file_name $filePath/$new_file_name
}

echo "Start applying these configuration files..."

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
apply_dot ~/.bash_completion bash

echo "Select your environment"
select varfile in home pitang; do
  # my_repositories
  if [ -f "$DF/.$varfile.myrepos" ]; then
    apply_dot_change ~/.myrepos . .$varfile.myrepos
  fi
  # aliases and functions
  if [ -f "$DF/bash/.$varfile.bash_custom" ]; then
    apply_dot_change ~/.bash_custom bash .$varfile.bash_custom
  fi
  # variables
  if [ -f "$DF/bash/.$varfile.bash_variables" ]; then
    apply_dot_change ~/.bash_variables bash .$varfile.bash_variables
    break
  fi
done

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

# Apply custom keys settings
xmodmap ~/.xmodmaprc

# Apply Xresources
xrdb ~/.Xresources

# Apply bash
. ~/.bashrc

# Reload i3
i3-msg restart

echo "Done applying this configuration."
echo "Your previous files are in the latest dotfiles backup."
echo "Run the revert.sh script to change back to your previous setup."

# Post environment variables installations
# makedirs
mkdir "$WORKSPACE"
mkdir "$WORKSPACE/go"
mkdir "$HOME/java"
mkdir "$HOME/Applications"

# Install vim
bash viminstall.sh

# Install st
bash stinstall.sh

