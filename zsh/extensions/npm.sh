#!/bin/bash

# adapted from : https://gist.github.com/othiym23/4ac31155da23962afd0e
function npm_upgrade () {
  for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f2)
  do
      npm -g install "$package"
  done
}