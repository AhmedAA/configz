#!/bin/bash

shopt -s nullglob

export DISPLAY=:0.0

cd ~/Pictures/wp/
while true; do
   files=()
   for i in *.jpg *.png *.jpeg; do
	[[ -f $i ]] && files+=("$i")
   done
   range=${#files[@]}
   ((range)) && feh --bg-scale "${files[RANDOM % range]}"
   break
done
