#!/bin/bash

# Installations (should run before the apply.sh)

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Command line stuff
brew install tree
brew install expect
brew install wget
brew install tmux
brew install vim
brew install cmake macvim
brew link --overwrite macvim
brew install neovim
brew install gh
brew install git bash-completion

# Install recent bash and configure
brew install bash
chsh -s /usr/local/bin/bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
ln -s /usr/local/bin/bash /usr/local/bin/bash-terminal-app

# Create directories
mkdir -p $HOME/.vim/tmp/{.backup,.swp,.undo}
mkdir -p $HOME/Trash
mkdir -p $HOME/Workspace

# vimplug
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Missing:
echo "Do it by hand:"

echo "Sequel pro"
echo "Spotify"
echo "Vlc"
echo "System preferences keyboard modifier keys"
echo "Adjust custom shortcuts"
echo "Gimp and inkscape equivalent"
echo "JAVA + maven"
echo "chrome"
echo "vscode"
echo "intellij"
echo "dropbox"
echo "google cloud"
echo "mongod + mongodbcompass"
echo "cheatsheet"
echo "mysql is better on docker"

# nvm and node
cd ~ && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
command -v nvm # check installation
# we source it to run continuously
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
nvm install node # latest
# npm installations
npm -g install typescript
npm -g install prettier
# yarn
npm install -g yarn

# Apply configurations
bash apply.sh

