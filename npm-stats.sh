#!/bin/bash

npm() {
  if [ "$1" == "i" ] || [[ $1 == ins* ]]; then
    start=$(date -u +"%s")
    command npm $@
    end=$(date -u +"%s")
    difference=$(($end-$start))
    mkdir -p ~/.npm-stats
    echo "$difference" >> ~/.npm-stats/timing
  else
    command npm $1
  fi
}

npm-stats() {
  installs=$(wc -l < ~/.npm-stats/timing | tr -d '[[:space:]]')
  total=0

  while read p; do
    total=$(($total+$p))
  done < ~/.npm-stats/timing

  echo "You've run npm install $installs times. For a total of $total seconds."
}
