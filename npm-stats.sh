#!/bin/bash

NPM_STATS_ROOT="$HOME/.npm-stats"
VERSION="1.0.0"

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

  if [ "$1" == "" ]; then
    _npm-stats-normal
  fi

  if [ $1 -eq "dates" ]; then
    _npm-stats-dates
  fi

  if [ $1 -eq "timing" ]; then
    _npm-stats-timing
  fi

  if [ $1 -eq "graph" ]; then
    _npm-stats-graph
  fi

  if [ $1 -eq "raw" ]; then
    _npm-stats-raw
  fi

  if [ $1 -eq "usage" ]; then
    _npm-stats-usage
  fi

  if [ $1 -eq "version" ]; then
    _npm-stats-version
  fi
}

_npm-stats-normal() {
  installs=$(wc -l < "$NPM_STATS_ROOT/timing" | tr -d '[[:space:]]')
  total=0

  while read p; do
    holder=$(echo "$p" | cut -f2 -d$'\t')
    total=$(($total+$holder))
  done < "$NPM_STATS_ROOT/timing"

  echo "You've run npm install $installs times. For a total of $total seconds."
}

_npm-stats-dates() {
  cat "$NPM_STATS_ROOT/timing" | cut -f1 -d$'\t'
}

_npm-stats-timing() {
  cat "$NPM_STATS_ROOT/timing" | cut -f2 -d$'\t'
}

_npm-stats-raw() {
  cat "$NPM_STATS_ROOT/timing"
}

_npm-stats-graph() {
  gnuplot -e '
    set ylabel "timing";
    set xlabel "date";
    set terminal dumb;
    set timefmt "%Y-%m-%d %H:%M:%S";
    set xdata time;
    plot "timing" using 1:3 with dots notitle
  '
}

_npm-stats-usage() {
  echo
  echo "npm-stats v$VERSION"
  echo
  echo "Usage:
  npm-stats             Show stats in human readable format
  npm-stats dates       Just show date data
  npm-stats timing      Just show timing data
  npm-stats graph       Show a graph of the stats
  npm-stats raw         Outputs raw data
  npm-stats help        Show this message
  npm-stats version   Show the current version installed
  "
}
