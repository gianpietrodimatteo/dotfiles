# Bash aliases
# A bash alias is a word to replace a line. Anything more complex than that, so
# as using the positional parameters or multiple lines of code should be a bash
# function. Put a space at the end if you wish to concatenate aliases, but
# remember to not refer to them anywhere else and avoid doing it here

alias mkdirp="mkdir -p"

alias ll="ls -l"
alias la="ls -lah"
alias lc="ls -CF"

alias trash="mv -t $HOME/.local/share/Trash/files/"

alias findr="sudo find / -name"
alias findh="find ~ -name"
alias finda="find . -name"

alias tara="tar zxvf "

alias rmi="rm -i"
alias rmrf="rm -rf"

alias deb="sudo dpkg -i"

alias notebook="$TERMINAL -n note -e sh -c 'cd $NOTESPATH && vim -c CtrlP -c ToggleWrap -c ToggleAutosave'"

alias vime="vim -c NERDTreeToggle"
alias vimp="vim -c CtrlP"
alias viq="vim $DONTCARE"

alias gitfap="git fetch --all --tags --prune"
alias gitfat="git fetch --all --tags"
alias gits="git status"
alias gitb="git branch"

alias lessh="less -m -N -g -i -J --line-numbers --underline-special"

# Motherfucking tmux and it's huge syntax
alias tml="tmux list-sessions"
alias tma="tmux attach-session -t"
alias tm0='tmux attach-session -t $(echo `tmux list-sessions` | cut -d ":" -f 1)'
alias tmns="tmux new -s"

alias hbkp="sort -u ~/.bash_history > ~/tmp/history-backup.txt"

alias sob="source ~/.bashrc"

alias allow="chmod u+x"

alias space2underscore='echo "${1// /_}"'

alias rm_empty_lines="sed -r '/^\s*$/d'"

alias e="exit"

alias vimupdate="vim -c 'source % | PlugClean | PlugInstall' $HOME/.vimrc"

alias tailf="tail -F"

alias gitrw="git checkout HEAD~"

alias gita="git add ."
alias gitm="git commit -m"
alias gitam="gita;gitm"

alias cpr="cp -r"
