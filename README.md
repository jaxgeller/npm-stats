[![Build Status](https://travis-ci.org/jaxgeller/npm-stats.svg?branch=master)](https://travis-ci.org/jaxgeller/npm-stats)

# npm-stats
Takes stats of npm commands.

Npm-stats does the following

+ Keeps track of all installs and logs them
+ Can generate graphs, output

### Why

I wondered how much of my life i was spending waiting on npm modules to install.

It seems nowadays that authors migrate their codebases to use lots of small modules rather than having large monoliths. This is great for developing, but not so great for the end user.

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


