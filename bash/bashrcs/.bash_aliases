# Bash aliases
# A bash alias is a word to replace a line. Anything more complex than that, so
# as using the positional parameters or multiple lines of code should be a bash
# function. Put a space at the end if you wish to concatenate aliases, but
# remember to not refer to them anywhere else and avoid doing it here

# Basic
alias mkdirp="mkdir -p"

alias ll="ls -l"
alias la="ls -lath"
alias lc="ls -CF"

alias cb="cd -"
alias cu="cd .."

alias cpr="cp -r"

alias rmi="rm -i"
alias rmr="rm -rf"

alias findr="sudo find / -name"
alias findh="find ~ -name"
alias finda="find . -name"
alias findi="find . -iname"

alias hgrep="history | grep"

alias book="vim ~/Dropbox/Escritos/Livro/livro-rascunho.txt"

alias sai="sudo apt install"
alias ai="apt install"

# Quick vim
alias viq="vim $DONTCARE"
alias vimupdate="vim -c 'source % | PlugClean | PlugInstall' $HOME/.vimrc"
alias vimo="vim -O"
alias suvim="sudo -E vim"
# Open all regular files in current folder windowed
alias vimhp="find ./* -maxdepth 0 -type f -exec vim {} +"

# Quick git
alias gitco="git co"
alias gitcob="git cob"
alias gitb="git b"
alias gitc="git c"
alias gits="git s"
alias gitunstage="git unstage"
alias gitlast="git last"
alias gitmt="git mt"
alias gitsa="git sa"
alias gitdf="git df"
alias gitcp="git cp"
alias gitp="git p"
alias gitps="git ps"
alias gitpr="git pr"
alias gitlol="git lol"
alias gitlola="git lola"
alias gitlogan="git logan"
alias gitrw="git rw"
alias gitbk="git bk"
alias gitrollback="git rollback"
alias gitfap="git fap"
alias gitfa="git fa"
alias gitcm="git cm"
alias gita="git a"
alias gitam="gita;gitcm"
alias gitpo="git po"
alias gitpom="git pom"

# GitUtil
alias amogre="git remote add origin https://github.com/gianpietrodimatteo/$1"
alias pullall="find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;"

# Quick tmux
alias tml="tmux list-sessions"
alias tma="tmux attach-session -t"
alias tm0='tmux attach-session -t $(echo `tmux list-sessions` | cut -d ":" -f 1)'
alias tmns="tmux new -s"

# System
alias e="exit"
alias allow="chmod u+x"
alias alle="chmod +x"
alias allall="chmod a+x"
alias deb="sudo dpkg -i"
alias ethdevices="nmcli device status"
alias sysver="uname -a; lsb_release -a; hostnamectl;"
alias ppa_remove="sudo add-apt-repository --remove ppa:"

# Util
alias curly="curl -sSL"
alias tailf="tail -F"
alias trash="mv -t $HOME/.local/share/Trash/files/"
alias lessh="less -m -N -g -i -J --line-numbers --underline-special"
alias ssh_rsa_email="ssh-keygen -t rsa -b 4096 -C"
alias dates="date +%F-%T"
alias smartree="tree -I 'node_modules|dist'"
alias wclass="xprop | grep WM_CLASS"
alias ga="ffmpeg -r 10 -i"
alias liquidate="date +\"%Y%m%d%H%M%S\""
alias cooldate="date +\"%Y/%m/%d:%H:%M:%S\""
alias namedate="date +\"%Y-%m-%d-%H-%M-%S\""
alias mongoreplica="sudo mongod --port 27017 --dbpath /var/lib/mongodb --replSet rs0 --bind_ip localhost"

# Bash
alias hbkp="sort -u ~/.bash_history > ~/tmp/history-backup.txt"
alias sob="source ~/.bashrc"
alias sot="source ~/.bash_test"

# Pitang
alias override_resolv="cp /etc/resolv.conf ~/tmp/resolv-backup.conf;sudo cp ~/Dropbox/Programacao/Pitang/vpn/resolv.conf /etc/resolv.conf"
alias vpn_pitang="cp /etc/resolv.conf ~/tmp/resolv-backup.conf;sudo cp ~/Dropbox/Programacao/Pitang/vpn/resolv.conf /etc/resolv.conf;cd /etc/openvpn/;sudo openvpn pitang.ovpn"
alias ssh_pitang="ssh-add ~/.ssh/id_rsa_pitang"

# Package/Unpackage
alias targz="tar zxvf"
alias tarbz2="tar -xvjf"
alias tarxz="tar -Jxxvf"
alias unrar="unrar x"
alias 7zip="7z e"
alias uniso="7z e"

# Misc
alias space2underscore='echo "${1// /_}"'
alias rm_empty_lines="sed -r '/^\s*$/d'"
alias moveToImageLibrary="mv *.jpg *.webm *.gif *.png ~/Pictures/Image\ Library/"

alias lmao="touch ayy{lmao,lmio,lon,loff,lobino,lobarito}{chuahili,suhali,bengali,mombojo}"

alias adevices="cat /proc/asound/cards"
alias ain="alsa_in -d hw:"
alias aou="alsa_out -d hw:"

alias hello="echo \"Hello to you too.\""
