#!/bin/bash

################################################################################
# Bash functions related to git
################################################################################

# gitdir - execute git in another directory
# usage: gitdir <directory>
gitdir() {
  if [ -d "$1" ]; then
    serverDir="$1";
    git --git-dir=$serverDir/.git --work-tree=$serverDir "${@:2}";
  else
    echo "ERROR: gitdir() - Must provide an existant directory.";
  fi
  echo -e;
}

gitremotes() {
  # Credit http://stackoverflow.com/a/2514279
  for branch in `git branch -r | grep -v HEAD`;do echo -e `git show
    --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r;
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

# gitpull - pull into a local branch without checking out. Remote and local branchnames must be the same
# usage: gitpull <branchname>
gitpull() {
  if [ -n "$2" ]; then
    git fetch "$1" "$2":"$2";
  else
    git fetch origin "$1":"$1";
  fi
}

# gitinit - initialize existing repository
# usage: gitinit
gitinit() {
  git init
  git add .
  git commit -m "Initial commit"
}

# gitrinit - initialize existing repository and add it's remote
# usage: gitrinit <remote>
gitrinit() {
  gitinit
  git remote add origin "$1"
  git push -u origin master
}

# githinit - initialize existing repository and add it's github remote for my account
# usage: githinit <remote-repository-name>
githinit() {
  gitinit
  git remote add origin https://github/gianpietrodimatteo/"$1"
  git push -u origin master
}

# amigo - add my github repo to the remotes with a specific name
# usage: amigo <remote-name> <remote-repository-name>
amigo() {
  git remote add "$1" https://github.com/gianpietrodimatteo/"$2"
}
