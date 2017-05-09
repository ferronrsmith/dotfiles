#!/bin/bash

# adapted from : https://gist.github.com/othiym23/4ac31155da23962afd0e
function npm_upgrade () {
  for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f4)
  do
      npm -g install "$package"
  done
}

function nvm_upgrade () {
  (
    cd "$NVM_DIR"
    git fetch origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
  ) && . "$NVM_DIR/nvm.sh"
}