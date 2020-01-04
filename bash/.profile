# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# Source custom completions
if [ -f "$HOME/src/tmux-completion.bash" ]; then
  source $HOME/src/tmux-completion.bash;
fi

export NVM_DIR="$HOME/.config"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export TERMINAL="st"

export MYVIMRC="$HOME/.vimrc"

export NOTESPATH="$HOME/Dropbox/Textos"

export JAVA_HOME="/usr/local/java/jdk1.8.0_221"
export JRE_HOME="/usr/local/java/jdk1.8.0_221/jre"
export M2_HOME="/opt/apache-maven-3.6.2"
export PATH="$PATH:$JAVA_HOME/bin:$JRE_HOME/bin:$M2_HOME/bin"

export JBOSS_HOME="/opt/wildfly-18.0.0.Final"
export PATH="$PATH:$JBOSS_HOME/bin"

# export PATH="$PATH:$HOME/workspace/local/idea-IC-192.7142.36/bin"
# export PATH="$PATH:$HOME/eclipse/jee-2019-09/eclipse"
# export PATH="$PATH:$HOME/workspace/local/TIB_js-studiocomm_6.11.0"

# export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/Workspace/go"
export PATH="$PATH:$GOPATH/bin"

export DONTCARE="$HOME/tmp/dontcare"

# Pipe Highlight to less
export LESSOPEN="| $(which highlight) %s --out-format xterm256 --line-numbers --quiet --force --style solarized-light"
export LESS=" -R"

export PATH="$PATH:/snap/bin"

export PATH="$PATH:$HOME/node_modules/.bin"

