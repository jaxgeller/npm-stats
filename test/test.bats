#!/usr/bin/env bats

source ../npm-stats.sh
rm -rf ~/.npm-stats
rm -rf node_modules

@test "test install singular" {
  npm install lodash
  results=$(npm-stats | awk '{print $6}')
  [ $results -eq 1 ]
}

@test "test install singular with abreviation 1" {
  npm i lodash

  results=$(npm-stats | awk '{print $6}')
  [ $results -eq 2 ]
}

@test "test install singular with abreviation 2" {
  npm ins lodash

  results=$(npm-stats | awk '{print $6}')
  [ $results -eq 3 ]
}

@test "test install multiple" {
  npm install bower grunt less

  results=$(npm-stats | awk '{print $6}')
  [ $results -eq 4 ]
}

@test "test install from package.json" {
  npm install

  results=$(npm-stats | awk '{print $6}')
  [ $results -eq 5 ]
}
