[![Build Status](https://travis-ci.org/jaxgeller/npm-stats.svg?branch=master)](https://travis-ci.org/jaxgeller/npm-stats)

# npm-stats
Takes stats of npm commands.

Npm-stats does the following

+ Keeps track of all installs and logs them
+ Can generate graphs, output

### Installation

For now clone this repo, and add npm-stats.sh to your `*sh profile`. Make sure to source it like so

```sh
#~/.zshrc

source ~/npm-stats.sh
```

### Use

npm-stats will hook into npm automatically, all you need to do is run `npm-stats` whenever you want some sweet stats.

```sh
npm-stats v1.0.0

Usage:
  npm-stats             Show stats in human readable format
  npm-stats dates       Just show date data
  npm-stats timing      Just show timing data
  npm-stats graph       Show a graph of the stats
  npm-stats raw         Outputs raw data
  npm-stats help        Show this message
  npm-stats version     Show the current version installed
```
