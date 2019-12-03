# bash shell aliases
alias mkdirp="mkdir -p"

alias ll='ls -l'
alias la='ls -lah'
alias lc='ls -CF'

alias trash='mv -t /home/gianpietro/.local/share/Trash/files/'

alias findr='sudo find / -name '

alias findh='find ~ -name '

alias tara='tar zxvf '

alias rmi='rm -i'

alias rmrf='rm -rf'

alias deb='sudo dpkg -i'

alias notebook="$TERMINAL -n note -e sh -c 'cd $NOTESPATH && vim -c CtrlP'"

alias vimep='vim -c NERDTreeToggle -c CtrlP'
alias vime='vim -c NERDTreeToggle'
alias vimp='vim -c CtrlP'

alias lprompt="$HOME/Workspace/prompt/launch.sh"

alias gitfap="git fetch --all --tags --prune"
alias gitfat="git fetch --all --tags"
