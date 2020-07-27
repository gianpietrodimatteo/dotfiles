#!/bin/bash

# Apply bash configurations script (run after install.sh)

new_backup () {
  proj="$HOME/dotfiles_backup";
  ver="backup_bash";
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
if [ -n $1 ]; then
  DBF="$1"
else
  DBF="$(new_backup)";
fi
DF="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";

apply_dot () {
  file=`basename $1`
  filePath=`dirname $1`
  backupFolder="$DBF/$2"
  mkdir -vp $backupFolder
  mv -v $1 $backupFolder
  ln -sv $DF/$2/$file $filePath
}

apply_dot_change () {
  new_file_name=`basename $1`
  filePath=`dirname $1`
  original_file_name="$3"
  backupFolder="$DBF/$2"
  mkdir -vp $backupFolder
  mv -v $1 $backupFolder
  ln -sv $DF/$2/$original_file_name $filePath/$new_file_name
}

echo "Applying bash configuration files..."

# bash
apply_dot ~/.bash_aliases bashrcs
apply_dot ~/.bash_functions bashrcs
apply_dot ~/.bashrc bashrcs
apply_dot ~/.inputrc other
apply_dot ~/.profile other
apply_dot ~/.bash_completion bashrcs

echo "Select your environment"
select varfile in home pitang; do
  # aliases and functions
  if [ -f "$DF/bash/.$varfile.bash_custom" ]; then
    echo "custom"
    apply_dot_change ~/.bash_custom . .$varfile.bash_custom
  fi
  # variables
  if [ -f "$DF/bash/.$varfile.bash_variables" ]; then
    echo "variable"
    apply_dot_change ~/.bash_variables . .$varfile.bash_variables
  fi
done

# Apply bash
. ~/.bashrc

echo "Done applying bash configurations."
