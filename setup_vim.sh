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

echo " Starting configuration for vim\n"

# clone vimfiles repo
git clone https://github.com/ferronrsmith/vimfiles.git ~/personal_git/vimfiles
cd ~/personal_git/vimfiles/
git submodule init && git submodule update


echo " Creating symlinks \n"

# create a symlink to my personal vimrc and tmux.conf files
ln -nfs ~/personal_git/dotfiles/.vimrc ~/.vimrc 
ln -nfs ~/personal_git/dotfiles/.tmux.conf ~/.tmux.conf

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   	ln -nfs ~/personal_git/dotfiles/.gitconfig ~/.gitconfig
	ln -nfs ~/personal_git/dotfiles/.zshrc_linux ~/.zshrc
elif [[ "$unamestr" == 'Darwin' ]]; then
	ln -nfs ~/personal_git/dotfiles/.gitconfig_mac ~/.gitconfig
	ln -nfs ~/personal_git/dotfiles/.zshrc_mac ~/.zshrc
fi

echo " Finish configuration for vim\n"

