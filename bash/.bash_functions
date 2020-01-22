#!/bin/bash


# functions - summary of custom user functions
# usage: functions
functions() {
  cat "${HOME}/.bash_functions" | grep -v ignore-from-help | grep -B 1 usage;
}

#
# navigation and basic operations
#
# mkcd - makedir and cd in it
# usage: mkcd <dir>
mkcd() {
  mkdir -p $1 && cd $1 ;
}

# cdl - cd and ls
# usage: cdl <dir>
cdl() {
  cd $1 && ls -a ;
}

cdi() {
  cd "$1"; git status
}

cath() {
  if [[ -n "$2" ]]; then
    highlight "$1" --out-format xterm256 --line-numbers --quiet --force --style solarized-light --syntax "$2";
  else
    highlight "$1" --out-format xterm256 --line-numbers --quiet --force --style solarized-light;
  fi
}

# For now, to be executed AT THE FOLDER OF THE FILE
# m2d - moves to dotfiles and creates symlink
# usage: m2d <target>
m2d() {
  fileName=$1;
  mv $fileName ~/dotfiles/;
  ln -sv ~/dotfiles/$fileName .
}

# vimep - vim nerd tree and ctrl p
# usage: vimep <target>
vimep() {
  if [ -z "$1" ]
  then
    dir=.;
  else
    dir=$1;
  fi
  cd $dir;
  vim -c NERDTreeToggle -c CtrlP
}

wherisp() {
  cat ~/.myrepos | grep "$1" | cut -d "|" -f 2 | envsubst;
}

gitdj() {
  gitd "$@";
  gitr "$@";
}

gitd() {
  local proj_path="$HOME/dotfiles";
  echo '# Dotfiles:';
  gitdir "$proj_path" "$@";
}

gitr() {
  local proj_path="$HOME/resources";
  echo '# Resources:';
  gitdir "$proj_path" "$@";
}

gitdir() {
  if [ -d "$1" ]; then
    serverDir="$1";
    git --git-dir=$serverDir/.git --work-tree=$serverDir "${@:2}";
  else
    echo "ERROR: gitdir() - Must provide an existant directory.";
  fi
  echo -e;
}

# gitme - execute command or download on all repositories listed in myrepos
# usage: gitme [ <command> ]
gitme() {
  # Read ~/.myreppos
  while read -u 10 p; do
    # If line is not a comment
    if [[ "$p" != \#* ]] && [ "$p" ] ; then
      echo "About project $(echo "$p" | cut -d "|" -f 1)";
          path=$(echo "$p" | cut -d "|" -f 2 | envsubst);
          remote=$(echo "$p" | cut -d "|" -f 3);
          # If no arguments were passed, install repositories
          if [ -z "$1" ]; then
            if [ ! -d "$path" ] ; then
              git clone "$remote" "$path";
            fi
          else
            gitdir "$path" "$@";
          fi
    fi
  done 10<$HOME/.myrepos
}

# gitme_current - execute command or download on all repositories listed in myrepos
# usage: gitme_current [ <command> ]
gitme_current() {
  # Read ~/.currentrepos
  while read -u 10 p; do
    # If line is not a comment
    if [[ "$p" != \#* ]] && [ "$p" ] ; then
      echo "About project $(echo "$p" | cut -d "|" -f 1)";
          path=$(echo "$p" | cut -d "|" -f 2 | envsubst);
          remote=$(echo "$p" | cut -d "|" -f 3);
          # If no arguments were passed, install repositories
          if [ -z "$1" ]; then
            if [ ! -d "$path" ] ; then
              git clone "$remote" "$path";
            fi
          else
            gitdir "$path" "$@";
          fi
    fi
  done 10<$HOME/.currentrepos
}

set_current() {
  grep -v "^#" ~/.myrepos | grep -v "^$" | cut -d "|" -f 1 > tmp/.repos_names;
  rm ~/.currentrepos;
  select proj_name in $(cat tmp/.repos_names) DONE; do
    cat .myrepos | grep "$proj_name|" >> ~/.currentrepos;
    if [[ "$proj_name" == "DONE" ]]; then
      break
    fi
  done
}

hibkp() {
  rm -f $HOME/tmp/history-install-backup.txt;
  while read p; do
    grep "^$p" $HOME/.bash_history >> $HOME/tmp/history-install-backup.txt;
  done < $HOME/src/history-install-grephelp
}

findc() {
  find "$1" -name "$2" 2> "$DONTCARE";
}

c2r() {
  if [ -z "$1" ]; then
    echo "Must specify filename";
  elif [ -z "$2" ]; then
    cp -r `findc $HOME $1` $HOME/resources/ ;
  elif [ -z "$3" ]; then
    cp -r `findc $1 $2` $HOME/resources ;
  elif [ -z "$4" ]; then
    cp -r `findc $1 $2` $HOME/resources/$3 ;
  else
    echo "What do you mean?";
  fi;
}

# new_version - creates a directory and returns it's path creating some crude versioning at the end of the name
# usage: new_version <dir> <dir>
new_version() {
  proj="$1";
  ver="$2";
  if [ -z "$3" ]; then
    i=1;
  else
    i="$3";
  fi
  stringa="$proj/$ver$i";

  if [ ! -d "$stringa" ]; then
    mkdir -p "$stringa";
    echo "$stringa";
  else
    new_version "$proj" "$ver" "$(($i+1))";
  fi
}

# smartconcat - concatenate two text files keeping everything from the destination and addind from the origin avoiding duplicates
# usage: smartconcat <origin> <destination>
smartconcat() {
  origin=$1;
  destination=$2;

  # We start by echoing the destination file
  cat "$destination" | sed -r '/^\s*$/d';

  # Then we read the origin
  while read -u 10 o; do
    already_exists=false;

    # For each line of the origin we compare it to each line of the destination for duplicates
    while read -u 10 d; do
      if [[ "$o" == "$d" ]]; then
        already_exists=true;
      fi
    done 10<$destination

    # If the line is new to destination we echo it as well
    if [ "$already_exists" = false ]; then
      echo "$o";
    fi
  done 10<$origin
}

# smartuniq - delete the duplicate lines of a text file, keeping the first or the last ocurrence
# usage: smartuniq [ <option> ] <file>
smartuniq() {
  echo "TODO";
}

# gitpull - pull into a local branch without checking out. Remote and local branchnames must be the same
# usage: gitpull <branchname>
gitpull() {
  if [ -n "$2" ]; then
    git fetch "$1" "$2":"$2";
  else
    git fetch origin "$1":"$1";
  fi
}

# asa - quickly search apt repositories. Shows only lines with a word match
# usage: asa <searchphrase>
asa() {
  apt-cache search $1 | grep $1
}

killport() {
  sudo kill -9 $(sudo fuser -n tcp $1 2> /dev/null);
}

# change_extensions - change the extension name of all files in current folder
# usage: change_extensions <old_extension> <new_extension>
change_extensions() {
  local old_extension="$1";
  local new_extension="$2";
  for file in *."$old_extension"
  do
    mv "$file" "${file%.$old_extension}.$new_extension"
  done
}

grepa() {
  grep -r "$1" .
}

gitremotes() {
  # Credit http://stackoverflow.com/a/2514279
  for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r
  }

# gitff - git fast foward one commit
# usage: gitff <reference_commit>
gitff() {
  if [[ -n "$1" ]]; then
    local child_commit="$(git rev-list --topo-order HEAD.."$*" | tail -1)"
    if [[ -n "$child_commit" ]]; then
      git checkout "$child_commit"
    else
      echo "Already in latest commit on stated reference, checking it out instead"
      git checkout "$1"
    fi
  else
    echo "Must provide a reference commit."
  fi
}

