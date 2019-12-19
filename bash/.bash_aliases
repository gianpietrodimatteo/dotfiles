# bash shell aliases
alias mkdirp="mkdir -p"

alias ll='ls -l'
alias la='ls -lah'
alias lc='ls -CF'

alias trash='mv -t /home/gianpietro/.local/share/Trash/files/'

alias findr='sudo find / -name '

alias findh='find ~ -name '

alias finda='find . -name'

alias tara='tar zxvf '

alias rmi='rm -i'

alias rmrf='rm -rf'

alias deb='sudo dpkg -i'

alias notebook="$TERMINAL -n note -e sh -c 'cd $NOTESPATH && vim -c CtrlP'"

alias vimep='vim -c NERDTreeToggle -c CtrlP'
alias vime='vim -c NERDTreeToggle'
alias vimp='vim -c CtrlP'

alias gitfap="git fetch --all --tags --prune"
alias gitfat="git fetch --all --tags"

alias lessh='less -m -N -g -i -J --line-numbers --underline-special'

alias cath="highlight $1 --out-format xterm256 --line-numbers --quiet --force --style solarized-light"

# Motherfucking tmux and it's huge syntax
alias tml="tmux list-sessions"
alias tma="tmux attach-session -t"
alias tm0='tmux attach-session -t $(echo `tmux list-sessions` | cut -d ":" -f 1)'
alias tmns="tmux new -s"
