#!/bin/bash
# bash functions

#
# bash_functions help
#
# help_funcs - summary of custom user functions
# usage: help-funcs
functions() {
  cat "${HOME}/.bash_functions" | grep -B 1 usage;
}

#
# navigation and basic operations
#
# mkcd - makedir and cd in it
# usage: mkcd <dir>
mkcd () {
  mkdir -p $1 && cd $1 ;
}

# cdl - cd and ls
# usage: cdl <dir>
cdl () {
  cd $1 && ls -a ;
}

# For now, to be executed AT THE FOLDER OF THE FILE
# Moves to dotfiles and creates symlink
# usage: m2d <target>
m2d () {
  fileName=$1;
  mv $fileName ~/dotfiles/;
  ln -sv ~/dotfiles/$fileName .
}

# Vim nerd tree and ctrl p
# usage: vimep <target>
vimep () {
  if [ -z "$1" ]
  then
    dir=.;
  else
    dir=$1;
  fi
  cd $dir;
  vim -c NERDTreeToggle -c CtrlP
}

gitp () {
  gitpc "$@";
  gitps "$@";
}

gitpc () {
  echo "# Prompt Client: ";
  dir="`wherisp prompt-client`";
  gitdir "$dir" "$@";
}

gitps () {
  echo "# Prompt Server: ";
  dir="`wherisp prompt-server`";
  gitdir "$dir" "$@";
}

wherisp () {
  cat ~/.myrepos | grep "$1" | cut -d ":" -f 2 | envsubst;
}

gitdir () {
  if [ -d "$1" ]; then
    serverDir="$1";
    git --git-dir=$serverDir/.git --work-tree=$serverDir "${@:2}";
    echo -e;
  else
    echo "ERROR: gitdir() - Must provide an existant directory.";
  fi
}

gitme () {
  wherisp > tmp/.myrepos_path;
  while read -u 10 p; do
    if [ "$p" != \#* ] && [ "$p" ] ; then
      echo "# $p:";
          gitdir "$p" "$@";
          echo -e;
    fi
  done 10<$HOME/tmp/.myrepos_path
}

hibkp () {
  rm -f $HOME/tmp/history-install-backup.txt;
  while read p; do
    grep "^$p" $HOME/.bash_history >> $HOME/tmp/history-install-backup.txt;
  done < $HOME/src/history-install-grephelp
}

findc () {
  find "$1" -name "$2" 2> "$DONTCARE";
}

c2r () {
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
