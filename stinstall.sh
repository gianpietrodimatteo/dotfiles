#!/bin/bash

# install dependencies
sudo apt install xorg openbox xauth \
  libx11-dev libxft-dev

# download and configure
cd "$WORKSPACE"
git clone https://github.com/gianpietrodimatteo/st.git
cd st
rm config.h

# install
sudo make install

# check version
st -version

