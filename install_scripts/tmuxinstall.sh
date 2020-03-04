#!/bin/bash

# Install latest tmux

# Start with the obvious
sudo apt update
sudo apt install libevent-dev ncurses-dev build-essential pkg-config
sudo apt install tmux

# libevent from tarball
cd ~/Downloads
curl -sSL
https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz > libevent.tar.gz
tar zxvf libevent.tar.gz
cd libevent
./configure && make
sudo make install

# ncurses from tarball
cd ~/Downloads
curl -sSL https://invisible-mirror.net/archives/ncurses/ncurses-5.7.tar.gz > ncurses.tar.gz
tar zxvf ncurses.tar.gz
cd ncurses
./configure && make
sudo make install

# finally, tmux itself (also from tarball)
cd ~/Downloads
curl -sSL https://github.com/tmux/tmux/releases/download/3.0a/tmux-3.0a.tar.gz > tmux.tar.gz
tar zxvf tmux.tar.gz
cd tmux
./configure && make
sudo make install

