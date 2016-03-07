#!/bin/bash

echo " Installing hub ..."

# clone vimfiles repo
git clone https://github.com/github/hub.git ~/personal_git/hub
cd ~/personal_git/hub/
./script/build -o ~/bin/hub