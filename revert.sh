#!/bin/bash

# Revert configurations to their previous state

select_backup () {
  select folder in `ls $HOME/dotfiles_backup`; do
    if [ ! -z "$folder" ]; then
      echo "$folder";
      break
    fi
  done
}

# Set backup folder and dotfiles folder
echo "Select backup to restore to:";
DBF="$HOME/dotfiles_backup/$(select_backup)";
DF="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";

revert_bkp () {
  file=`basename $1`
  filePath=`dirname $1`
  cp -v $DBF/$2/$file $filePath
}

echo "Reverting to previous configuration..."

# misc
revert_bkp_change ~/.fonts .

# bash
revert_bkp_change ~/.bash . bash
bash ~/.bash/revert.sh "$DBF"

# git
revert_bkp ~/.gitconfig . 

# bin
revert_bkp /bin .

# tmux
revert_bkp ~/.tmux.conf .

# src
revert_bkp ~/src .

echo "Done."
