#!/bin/zsh

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/personal_git/dotfiles/zsh/.zsh/^README.md(.N); do
  ln -nfs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

#setopt EXTENDED_GLOB
#for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#done
