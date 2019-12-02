# bash shell functions

# Moves to dotfiles and creates symlink
# For now, to be executed AT THE FOLDER OF THE FILE
function m2d() {
  fileName=$1
  mv $fileName ~/dotfiles/
  ln -sv ~/dotfiles/$fileName .
}

function oproj() {
  dir=$1
  cd $dir
  vim -c NERDTreeToggle -c CtrlP
}

function gitp() {
 echo "# Client: "
 git -C $HOME/Workspace/prompt/prompt-client/ $1
 echo -e "\n# Server: "
 git -C $HOME/Workspace/prompt/prompt-server/ $1
}
