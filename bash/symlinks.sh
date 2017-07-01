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

COMPANY_NAME=conscia

ln -nfs ~/personal_git/dotfiles/vim/.vimrc ~/.vimrc
ln -nfs ~/personal_git/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -nfs ~/personal_git/vimfiles/ ~/.vim

unamestr=`uname`
echo "loading $unamestr config"

if [[ "$unamestr" == 'Linux' ]]; then
	SYS_ID=linux
	ln -nfs ~/personal_git/dotfiles/.Xresources ~/.Xresources
	ln -nfs ~/personal_git/dotfiles/.Xresources ~/.Xdefaults
elif [[ "$unamestr" == *CYGWIN* ]]; then
	SYS_ID=cygwin
	ln -nfs ~/personal_git/dotfiles/vagrant/Vagrantfile ~/Vagrantfile
elif [[ "$unamestr" == 'Darwin' ]]; then
	SYS_ID=mac
fi

ln -nfs "~/personal_git/dotfiles/git/${SYS_ID}/.gitconfig" ~/.gitconfig
ln -nfs "~/personal_git/dotfiles/zsh/${SYS_ID}/.zshrc" ~/.zshrc
ln -nfs "~/personal_git/dotfiles/ack/.ackrc" ~/.ackrc
sh "~/personal_git/dotfiles/zsh/${SYS_ID}/shell.sh"

# work related symlinks
mkdir -p "~/personal_git/${COMPANY_NAME}"
ln -nfs ~/personal_git/dotfiles/bash/git_update.sh "~/personal_git/${COMPANY_NAME}/update.sh"

echo "Finish Configuring vim symlinks"
