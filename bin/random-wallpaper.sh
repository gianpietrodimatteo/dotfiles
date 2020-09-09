#!/bin/bash

wpdir=~/Dropbox/Wallpapers

# Could be more than 1
N=1

cd $wpdir
ls |sort -R |tail -$N |while read file; do
  feh --bg-fill $file
done

