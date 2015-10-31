#!/usr/bin/env bats

exit 0

#source ../npm-stats.sh
#rm -rf ~/.npm-stats
#rm -rf node_modules

# @test "test install singular" {
#   npm install lodash

#   results=$(npm-stats | awk '{print $5}')
#   [ "$results" -eq "1" ]
# }

# @test "test install singular with abreviation 1" {
#   npm i underscore

#   results=$(npm-stats | awk '{print $5}')
#   [ "$results" -eq "1" ]
# }

# @test "test install singular with abreviation 2" {
#   npm ins async

#   results=$(npm-stats | awk '{print $5}')
#   [ "$results" -eq "1" ]
# }

# @test "test install multiple" {
#   npm install request chalk

#   results=$(npm-stats | awk '{print $5}')
#   [ "$results" -eq "1" ]
# }

# @test "test install from package.json" {
#   npm install

#   results=$(npm-stats | awk '{print $5}')
#   [ "$results" -eq "1" ]
# }
