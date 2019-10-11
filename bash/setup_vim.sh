#!/bin/bash

echo " Cloning Vimfiles and updating submodules"

# clone vimfiles repo
git clone git@github.com:ferronrsmith/dotvim.git ~/personal_git/vimfiles
cd ~/personal_git/vimfiles/
git submodule init && git submodule update

cd ~/personal_git/dotfiles/bash
echo 'configuring symlink...'
# call symlink file to create the necessary links
sh ./symlinks.sh # exact path for the script file

sh ./copyfonts.sh # copy fonts to .fonts directory

#sh ../hub/./hub.sh # install http://hub.github.com/
