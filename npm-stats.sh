#!/bin/bash

NPM_STATS_ROOT="$HOME/.npm-stats"
NPM_STATS_VERSION="1.0.0"

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

  if [ "$1" == "usage" ] || [ "$1" == "help" ]; then
    _npm-stats-usage
    return 0
  fi

  if [ "$1" == "version" ]; then
    _npm-stats-version
    return 0
  fi

  if [ ! -f "$NPM_STATS_ROOT/timing" ]; then
    echo "No stats to report right now"
    return 1
  fi

  if [ "$1" == "" ]; then
    _npm-stats-normal
    return 0
  fi

  if [ "$1" == "dates" ]; then
    _npm-stats-dates
    return 0
  fi

  if [ "$1" == "timing" ]; then
    _npm-stats-timing
    return 0
  fi

  if [ "$1" == "graph" ]; then
    _npm-stats-graph
    return 0
  fi

  if [ "$1" == "raw" ]; then
    _npm-stats-raw
    return 0
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
  cut -f1 -d$'\t' "$NPM_STATS_ROOT/timing"
}

_npm-stats-timing() {
  cut -f2 -d$'\t' "$NPM_STATS_ROOT/timing"
}

_npm-stats-raw() {
  cat "$NPM_STATS_ROOT/timing"
}

_npm-stats-usage() {
  echo
  echo "npm-stats v$NPM_STATS_VERSION"
  echo
  echo "Usage:
  npm-stats             Show stats in human readable format
  npm-stats dates       Just show date data
  npm-stats timing      Just show timing data
  npm-stats graph       Show a graph of the stats
  npm-stats raw         Outputs raw data
  npm-stats help        Show this message
  npm-stats version     Show the current version installed
  "
}

_npm-stats-version() {
  echo "$NPM_STATS_VERSION"
}

_npm-stats-graph() {
  cut -f2 -d$'\t' "$NPM_STATS_ROOT/timing" > "$NPM_STATS_ROOT/graph-data.dat"

  gnuplot -e '
    set terminal dumb;
    set offset graph 0.01, graph 0.01, graph 0, graph 0;
    set xlabel "timing";
    set title "npm install timing distribution" offset 0,1;
    binwidth=5;
    set boxwidth binwidth;
    bin(x,width)=width*floor(x/width) + binwidth/2.0;
    plot "~/.npm-stats/graph-data.dat" using (bin($1,binwidth)):(1.0) smooth freq with boxes notitle
  '
}
