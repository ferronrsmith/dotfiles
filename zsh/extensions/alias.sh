#!/bin/sh

# Important
alias df="df -h"
alias cls="clear"
alias mygit="cd ${_MY_GIT}"
alias dotfiles="cd ${_DOTFILES}"

alias vi='vim'          # aliasing vi to vim. who needs vi ?
alias cdo="cd -"
alias c="clear"
alias reload="source ~/.zshrc"
alias rr="source ~/.zshrc"
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowdate='date +"%d-%m-%Y"'
alias ps-cpu="ps -e -o pcpu,pid,comm --sort -%cpu  | head -n 5"
alias ps-mem="ps -e  -o pmem,vsz,rss,pid,comm --sort -%mem  | head -n 5"
alias untar='tar xvf'


# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'


# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'


# distro specific  - Debian / Ubuntu and friends #
# install with apt-get
alias apt-get="sudo apt-fast"
alias updatey="sudo apt-fast --y"

# update on one command
alias update='sudo apt-fast update -y && sudo apt-fast upgrade - y && sudo apt-fast dist-upgrade - y'

# become root #
alias root='sudo -i'
alias su='sudo -i'
alias wget='wget -c'

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0  ]; then
  alias reboot='sudo reboot'
fi


# Detect which `ls` flavor is in use
#echo test > afile.txt
#..redirects stdout to afile.txt. This is the same as doing..
#
#echo test 1> afile.txt
#To redirect stderr, you do..
#
#echo test 2> afile.txt
#>& is the syntax to redirect a stream to another file descriptor - 0 is stdin. 1 is stdout. 2 is stderr.
# in short.. 2> redirects stderr to an (unspecified) file, appending &1 redirects stderr to stdout
# http://stackoverflow.com/questions/818255/in-the-shell-what-is-21
if ls --color > /dev/null 2>&1; then # GNU `ls`
        colorflag="--color"
else # OS X `ls`
        colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# nice aliases
alias t='tail -f'
alias sgrep=" grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS,target,.idea,.settings,bin,obj} --exclude-from=${_DOTFILES}/zsh/exclude.txt"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# because typing 'cd' is A LOT of work!!
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# directory
alias dud='du -d 1 -h'
alias duf='du -sh *'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"
