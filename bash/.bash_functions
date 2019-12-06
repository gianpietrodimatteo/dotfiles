# bash shell functions

# Moves to dotfiles and creates symlink
# For now, to be executed AT THE FOLDER OF THE FILE
function m2d() {
  fileName=$1;
  mv $fileName ~/dotfiles/;
  ln -sv ~/dotfiles/$fileName .
}

function oproj() {
  dir=$1;
  cd $dir;
  vim -c NERDTreeToggle -c CtrlP
}

function gitp() {
  echo "# Client: ";
  git --git-dir=$HOME/Workspace/prompt/prompt-client/.git "$@";
  echo -e "\n# Server: ";
  git --git-dir=$HOME/Workspace/prompt/prompt-server/.git "$@";
}

function gitme() {
  while read -u 10 p; do
    git -C $p $1;
  done 10<$HOME/.myrepos
}
# function gitme() {
#   for REP in `cat $HOME/myrepos` ; do
#     git -C $REP $1;
#   done
# }
# while read l; do
#   echo "$l"
#   git -C "$l" $1
# done <$HOME/myrepos
