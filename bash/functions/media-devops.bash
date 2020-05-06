#!/bin/bash

################################################################################
# Gians bash functions related to media work
################################################################################

initkden() {
  mkdir -p ~/video_workspace/$1/Videos ~/video_workspace/$1/Audio
}

initrecord() {
  mkdir -p ~/recordings/$1 ~/audio_workspace/$1/Audio
}

initall() {
  initkden $1
  initrecord $1
}

tallkden() {
  tmickden "$1"
  tcamkden "$1"
}

taudiokden() {
  mv ${@:2} ~/video_workspace/$1/Audio/
}

tmickden() {
  if [[ -n $1 ]]; then
    cp ~/audio_workspace/$1/Audio/* ~/video_workspace/$1/Audio/
  fi
}

tvideokden() {
  mv ${@:2} ~/video_workspace/$1/Videos/
}

tcamkden() {
  if [[ -n $1 ]]; then
    cp ~/recordings/$1/* ~/video_workspace/$1/Videos/
  fi
}

