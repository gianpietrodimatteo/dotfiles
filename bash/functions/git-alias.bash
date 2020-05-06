#!/bin/bash

################################################################################
# Bash functions related aliasing projects git operations (temporary untill gdo comes out)
################################################################################

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
