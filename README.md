# npm-stats [![Build Status](https://travis-ci.org/jaxgeller/npm-stats.svg?branch=master)](https://travis-ci.org/jaxgeller/npm-stats)
Ever wonder how much of your life you spend on npm installs? npm-stats logs how much time you spend running npm commands.

### Installation

+ Clone this repo to your home like, `$HOME/.npm-stats`
+ Source this script with your profile of choice. Make sure to add it at the end

```sh
mkdir -p "$HOME/.npm-stats"
git clone https://github.com/jaxgeller/npm-stats "$HOME/.npm-stats"
echo "source $HOME/.npm-stats/npm-stats.sh" >> some_*rc
```

### Usage

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

### How it works

npm-stats is a simple bash script. When you source it into your shell, it acts as a simple pre-filter to npm. If you run any command associated with installing, it appends to a log at `~/.npm-stats/timing` with the date and how long it took in seconds.

npm-stats also provides some helper functions to help understand the logging, such as graphing and parsing the log.

### Updating

Updating is simple, just cd into `$HOME/.npm-stats`, run git pull, and refresh the shell.

### Examples

```sh
$ npm-stats

You've run npm install 5 times. For a total of 7 seconds.
```

```sh
$ npm-stats graph

  12 +-++-+--+-+--+--+-+--+-+--+--+-+--+-+--+-+--+--+-+--+-+--+--+-+--+-++-+
     +       +       +      +       +       +       +      +       +   .   +
     |                                                                     |
  10 +-+                                                                 +-+
     |                                                                     |
     |                                                                     |
   8 +-+                                                                 +-+
     |           .                                                         |
     |                                                                     |
   6 +-+                               .                                 +-+
     |                                                                     |
     |                                                                     |
   4 +-+                  .                    .                         +-+
     |       .                                                             |
     |          .                                                          |
   2 +.+                                                            .    +-+
     |   .                                                          .      |
     +       +       +      +       +       +       +      +       +       +
   0 +-++-+--+-+--+--+-+--+-+--+--+-+--+-+--+-+--+--+-+--+-+--+--+-+--+-++-+
   09:00   12:00   15:00  18:00   21:00   24:00   27:00  30:00   33:00   36:00
                                      date
```

```sh
$ npm-stats raw

2015-10-31 15:09:25 2
2015-10-31 15:10:26 1
2015-10-31 15:33:25 1
2015-10-31 15:33:27 2
2015-10-31 15:33:28 1
2015-10-31 15:34:31 11
2015-10-31 15:34:35 1
2015-10-31 15:35:13 9
```
