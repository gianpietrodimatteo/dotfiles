#!/bin/bash

################################################################################
# Gians bash functions
################################################################################

# functions - summary of custom user functions
# usage: functions
functions() {
  cat ${HOME}/.bash_functions ${HOME}/.bash/function/* | grep -v ignore-from-help | grep -B 1 usage;
}

################################################################################
# Navigation and basic operations
################################################################################

# mkcd - makedir and cd in it
# usage: mkcd <dir>
mkcd() {
  mkdir -p $1 && cd $1 ;
}

# cdl - cd and ls
# usage: cdl <dir>
cdl() {
  cd $1 && ls -a;
}

# cdi - cd and git status
# usage: cdi <dir>
cdi() {
  cd "$1"; git status
}

# cath - cat for displaying with syntax highlighting
# usage: cath <dir>
cath() {
  if [[ -n "$2" ]]; then
    highlight "$1" --out-format xterm256 --line-numbers --quiet --force --style solarized-light --syntax "$2";
  else
    highlight "$1" --out-format xterm256 --line-numbers --quiet --force --style solarized-light;
  fi
}

# m2d - moves to dotfiles and creates symlink
# usage: m2d <target>
m2d() {
  fileName=$(readlink -f $1);
  mv -vp $fileName ~/dotfiles/;
  ln -sv ~/dotfiles/$fileName .
}

# TODO
goto() {
  if [ -z "$1" ]
  then
    dir=.;
  else
    dir=$1;
  fi
  cd $dir;
}

# vimep - vim nerd tree and ctrl p
# usage: vimep <target>
vimep() {
  goto "$1"
  vim -c NERDTreeToggle -c CtrlP
}

# vimp - vim ctrl p
# usage: vimp <target>
vimp() {
  goto "$1"
  vim -c CtrlP
}

# vime - vim nerd tree
# usage: vimp <target>
vime() {
  goto "$1"
  vim -c NERDTreeToggle
}

# vimall - concatenate all files of folder and open up in vim
# usage: vimall [<directory>]
vimall() {
  if [ -n $1 ]; then
    dir=$(pwd)/$1
  else
    dir=.
  fi
  vim <(cat $dir/*)
}

# hibkp - history install backup - file at ~/tmp/hsitory-install-backup.txt
# usage: hibkp
hibkp() {
  rm -f $HOME/tmp/history-install-backup.txt;
  while read p; do
    grep "^$p" $HOME/.bash_history >> $HOME/tmp/history-install-backup.txt;
  done < $HOME/src/history-install-grephelp
}

# findc - find file on folder without error print
# usage: findc <directory> <name> TODO
findc() {
  find "$1" -iname "$2" 2> "$DONTCARE";
}

# c2r - copy file to resources
# usage: c2r TODO
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

# asa - quickly search apt repositories. Shows only lines with a word match
# usage: asa <searchphrase>
asa() {
  apt-cache search $1 | grep $1
}

# killport - kill process using port
# usage: killport <port>
killport() {
  sudo kill -9 $(sudo fuser -n tcp $1 2> /dev/null);
}

grepa() {
  grep -r "$@" .
}

# notebook - Open up the notebook
# usage: notebook
notebook() {
  $TERMINAL -n note -e sh -c 'cd $NOTESPATH && vim -c CtrlP -c ToggleWrap -c "silent ToggleAutosave"'
}

# keycode - view input keycode on the terminal
# usage: keycode
keycode() {
  echo "Ctrl+C on the terminal to stop. Move mouse to display."
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

# TODO
vims() {
  vim $(find . -iname "$1")
}

# exists_partial_name - Exists a file with name containing the search
# usage: exists_partial_name <search>
exists_partial_name() {
  for name in *$1*; do
    if [ -f "$name" ]; then
      printf 'at least one file exists (%s)\n' "$name"
      break
    fi
  done
}

# loop_args - loop all arguments given to this function afterwards
# usage: loop_args
loop_args() {
  for arg in "$@"; do
    echo "$arg"
  done
}

# co - shortcuts for your configurations, check completion
# usage: co <configuration>
co() {
  conf "$@"
  source ~/.bashrc
}

# TODO
flatenize() {
  local name="$(basename $(lowercase $1))"
  if [[ -n $2 ]]; then
    name="$2-$name"
  fi
  for item in $1*
  do
    if [[ -d $item ]]; then
      flatenize "$item/" $name
    else
      echo "$name-$(basename $item)"
    fi
  done
}

# TODO
nesterize() {
  echo TODO
}

# lowercase - print folowing arguments in lowercase
# usage: lowercase[<name>]
lowercase() {
  echo "$@" | tr '[:upper:]' '[:lower:]'
}

# spring_init - Extract recently downloaded spring project with the spring initialzr
# usage: spring_init <project-name>
spring_init() {
  mv $HOME/Downloads/$1.zip $WORKSPACE/spring/
  cd $WORKSPACE/spring/
  unzip $1.zip
  rm $1.zip
}

# rmppa - remove ppa
# usage: rmppa <ppa-name>
rmppa() {
  PPA_Name="$1"
  sudo add-apt-repository --remove ppa:$PPA_Name/ppa
}

# vf - vimfind - open in vim the 3 first results of a recursive partial search
# usage: vf <search>
vf() {
  vim -O $(ffs "$1" | head -n 3)
}

# ff - find function recursively with partial search
# usage: ff <search>
ff() {
  find . -type f \( -path '*/target/*' -o -path '*/node_modules/*' -o -path '*/dist/*' \) -prune -o -iname "*$1*" -print
}

# ffs - find function with grep for further cleaning results
# usage: ffs <search>
ffs() {
  findfunc "$1" | grep -v "/node_modules"| grep -v "/dist"| grep -v "/target"
}

# jave - java and javac. Name it without .class
# usage: jave <java-file>
jave() {
  javac $1.java; java $1
}

# sourcedir - source all files in directory
# usage: sourcedir <directory>
sourcedir() {
  for f in $1/*; do source $f; done
}

# rmdq - remove double quotes
# usage: rmdq <string>
rmdq() {
  sed -e 's/^"//' -e 's/"$//' <<<"$1"
}

# rmsq - remove single quotes
# usage: rmsq <string>
rmsq() {
  sed -e "s/^'//" -e "s/'$//" <<<"$1"
}

nesquick() {
  echo "generate module"
  while getopts "scm" OPT; do
    case "$OPT" in
      "s") echo "generate service";;
      "c") echo "generate controller";;
      "m") echo "generate middleware";;
    esac
  done
  # nest g module "$@"
  # nest g service "$@"
  # nest g controller "$@"
}

gitamp() {
  gitam "$@"; git pom
}

################################################################################
# Other function files
################################################################################

# Source all files in functions folder
for f in ~/.bash/functions/*; do source $f; done



