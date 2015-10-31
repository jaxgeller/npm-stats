#!/bin/bash

npm() {
  if [ "$1" == "i" ] || [[ $1 == ins* ]]; then
    start=$(date -u +"%s")
    command npm $@
    end=$(date -u +"%s")
    difference="$(($end-$start))"
    mkdir -p ~/.npm-stats
    date="$(date '+%Y-%m-%d %H:%M:%S')"
    echo "$date\t$difference" >> ~/.npm-stats/timing
  else
    command npm $1
  fi
}

npm-stats() {

  if [ ! -f ~/.npm-stats/timing ]; then
    echo "No stats to report right now"
    return 1
  fi

  installs=$(wc -l < ~/.npm-stats/timing | tr -d '[[:space:]]')
  total=0

  while read p; do
    holder=$(echo "$p" | cut -f2 -d$'\t')
    total=$(($total+$holder))
  done < ~/.npm-stats/timing

  echo "You've run npm install $installs times. For a total of $total seconds."
}
