[![Build Status](https://travis-ci.org/jaxgeller/npm-stats.svg?branch=master)](https://travis-ci.org/jaxgeller/npm-stats)

# npm-stats
Counts the number of times you run `npm install` and keeps track of how long each iteration takes.


It seems now-a-days that node module authors love to split things into tiny modules. It makes sense for the author, but for the consumer it kind of sucks.  Installing something like 20 modules at a time becomes the norm. I wanted to see how much of life I've wasted waiting for npm to install.

### Installation

run `curl | sh`

or `git clone` this repo and add npm-stats in a safe place and source it in your *sh profile.


### Use

npm-stats will hook into npm automatically, all you need to do is run `npm-stats`.

More docs and testing coming later
