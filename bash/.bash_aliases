# Bash aliases
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

alias vime='vim -c NERDTreeToggle'
alias vimp='vim -c CtrlP'
alias viq='vim ~/tmp/draft.txt'

alias gitfap="git fetch --all --tags --prune"
alias gitfat="git fetch --all --tags"

alias lessh='less -m -N -g -i -J --line-numbers --underline-special'

alias cath="highlight $1 --out-format xterm256 --line-numbers --quiet --force --style solarized-light"
alias cats="highlight $1 --out-format xterm256 --line-numbers --quiet --force --style solarized-light --syntax $2"

# Motherfucking tmux and it's huge syntax
alias tml="tmux list-sessions"
alias tma="tmux attach-session -t"
alias tm0='tmux attach-session -t $(echo `tmux list-sessions` | cut -d ":" -f 1)'
alias tmns="tmux new -s"

# Motherfucking docker and it's huge syntax
# alias dockerl="docker container ls -a"
# alias dockeri="docker image ls -a"
# alias dockerb="docker exec -it $1 bash"
# alias docker0="docker exec -it $(echo `docker container ls -a` | cut -d " " -f 9) bash"

alias hbkp="sort -u ~/.bash_history > ~/tmp/history-backup.txt"

alias sob="source ~/.bashrc;"

# alias rep="sed s/$1/$2/g $3"

alias allow="chmod u+x"

alias space2underscore='echo "${1// /_}"'

alias rm_empty_lines="sed -r '/^\s*$/d'"

