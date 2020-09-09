#!/bin/bash

################################################################################
# Bash functions that work with gdo (temporary)
################################################################################

# wherisp - where is project?
# usage: wherisp <project-name>
wherisp() {
  cat ~/.myrepos | grep "$1" | cut -d "|" -f 2 | envsubst;
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
