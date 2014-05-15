#!/bin/bash
echo "
                    .-'''-.
                   / .===. \\
                   \/ 6 6 \/
                   ( \___/ )
      _________ooo__\_____/______________
     /                                   \\
    |   ferron   ferronrsmith@gmail.com   |
     \_______________________ooo_________/
                    |  |  |
                    |_ | _|
                    |  |  |
                    |__|__|
                    /-'Y'-\\
                   (__/ \__)
"
echo "Configuring vim symlinks"

ln -nfs ~/personal_git/dotfiles/vim/.vimrc ~/.vimrc
ln -nfs ~/personal_git/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -nfs ~/personal_git/vimfiles/ ~/.vim

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	ln -nfs ~/personal_git/dotfiles/git/linux/.gitconfig ~/.gitconfig
	ln -nfs ~/personal_git/dotfiles/zsh/linux/.zshrc ~/.zshrc
	ln -nfs ~/personal_git/dotfiles/bash/linux/.bashrc ~/.bashrc
elif [[ "$unamestr" == '*CYGWIN*' ]]; then
	ln -nfs ~/personal_git/dotfiles/git/cygwin/.gitconfig ~/.gitconfig
	ln -nfs ~/personal_git/dotfiles/zsh/cygwin/.zshrc ~/.zshrc
	ln -nfs ~/personal_git/dotfiles/bash/cygwin/.bashrc ~/.bashrc
elif [[ "$unamestr" == 'Darwin' ]]; then
	ln -nfs ~/personal_git/dotfiles/git/mac/.gitconfig ~/.gitconfig
	ln -nfs ~/personal_git/dotfiles/zsh/mac/.zshrc ~/.zshrc
fi

echo "Finish Configuring vim symlinks"
