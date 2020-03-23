#!/bin/bash

# This is the multi keyboard setter
# Requires xinput
# this is for my quickfire rapid pro, us layout

echo "Setting up new keyboard settings for the QuickFire rapid pro"
xinput -list | grep key

# Generally it comes with two different numbers, just to make sure
setxkbmap -device $(xinput -list | grep key | grep QuickFire | \
  cut -d '=' -f 2 | cut -d '[' -f 1 | awk 'NR==1') -layout us -variant intl

setxkbmap -device $(xinput -list | grep key | grep QuickFire | \
  cut -d '=' -f 2 | cut -d '[' -f 1 | awk 'NR==2') -layout us -variant intl

