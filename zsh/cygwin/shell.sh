#!/bin/bash
set -e

SIMPLE_BACKUP_SUFFIX=".orig"
APT_CYG="$(mktemp /tmp/apt-cyg.XXXXXXXX)"

# install apt-cyg
wget --no-check-certificate "https://raw.githubusercontent.com/ferronrsmith/dotfiles/master/apt-cyg/apt-cyg" -O "${APT_CYG}"
chmod +x "${APT_CYG}"

# install some stuff like vim and git
"${APT_CYG}" install zsh mintty vim curl git openssh git-completion git-gui gitk

# install OH MY ZSH
git clone --recursive git@github.com:ferronrsmith/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

sh ~/personal_git/dotfiles/zsh/zsh_links.sh

# install apt-cyg
install --backup "${APT_CYG}" /bin/apt-cyg

# setting up zsh as default
sed -i "s/$USER\:\/bin\/bash/$USER\:\/bin\/zsh/g" /etc/passwd

# et voila just start it
/usr/bin/env zsh
