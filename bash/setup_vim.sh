#!/bin/bash

echo " Cloning Vimfiles and updating submodules"

# clone vimfiles repo
git clone https://github.com/ferronrsmith/vimfiles.git ~/personal_git/vimfiles
cd ~/personal_git/vimfiles/
git submodule init && git submodule update

cd ~/personal_git/dotfiles/bash
echo 'configuring symlink...'
# call symlink file to create the necessary links
exec ./symlinks.sh # exact path for the script file
