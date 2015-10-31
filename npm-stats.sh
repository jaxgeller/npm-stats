#!/bin/bash

NPM_STATS_ROOT="$HOME/.npm-stats"

npm() {
  if [ "$1" == "i" ] || [[ $1 == ins* ]]; then
    start=$(date -u +"%s")
    command npm $@
    end=$(date -u +"%s")
    difference="$(($end-$start))"
    mkdir -p $NPM_STATS_ROOT
    date="$(date '+%Y-%m-%d %H:%M:%S')"
    echo "$date\t$difference" >> "$NPM_STATS_ROOT/timing"
  else
    command npm $1
  fi
}

npm-stats() {

  if [ ! -f "$NPM_STATS_ROOT/timing" ]; then
    echo "No stats to report right now"
    return 1
  fi

  installs=$(wc -l < "$NPM_STATS_ROOT/timing" | tr -d '[[:space:]]')
  total=0

  while read p; do
    holder=$(echo "$p" | cut -f2 -d$'\t')
    total=$(($total+$holder))
  done < "$NPM_STATS_ROOT/timing"

  echo "You've run npm install $installs times. For a total of $total seconds."
}
