# nice collection of shared functionality

export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"
export MAVEN_OPTS="-Xms256m -Xmx512m -Djava.awt.headless=true"
export LANG=C.UTF-8
export DOTFILES="${HOME}/personal_git/dotfiles/"
export JETTY_DEBUG_FLAG="
    -Xdebug -agentlib:jdwp=transport=dt_socket,address=9911,server=y,suspend=n"

export JPDA_OPTS="
	-Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8000,suspend=n"
    
alias gw="cd $HOME/work/workspaceGroupby/bindle"
alias gw2="cd $HOME/work/workspaceGroupby/future/bindle"
alias cloud="cd $HOME/work/workspaceGroupby/cloud"
alias future="cd $HOME/work/workspaceGroupby/future/bindle"
alias df="df -h"
alias cls="clear"
alias mygit="cd $HOME/personal_git"
alias dotfiles="cd $HOME/personal_git/dotfiles"
alias vi='vim'          # aliasing vi to vim. who needs vi ?
alias cdo="cd -"
alias c="clear"
alias reload="source ~/.zshrc"
alias rr="source ~/.zshrc"
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

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
alias apt-get="sudo apt-get"
alias updatey="sudo apt-get --yes"
 
# update on one command 
alias update='sudo apt-get update && sudo apt-get upgrade'

# become root #
alias root='sudo -i'
alias su='sudo -i'
alias wget='wget -c'

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0  ]; then
  alias reboot='sudo reboot'
fi


# the following is a an alias for hub.github.com pull-request function
function pull_req () {
    BRANCH=$2
    if [ -z "$1" ]; then
    echo 'You did not specify a issue # !'
        return;
  fi
    if [ -z "$2" ]; then
    BRANCH="develop"
  fi
    hub pull-request -i $1 -b $BRANCH
}

function clone_me () {
  hub clone ferronrsmith/$1
}

# simple python server
function pserv {
  PORT=$1
  if [ -z "$1" ]; then
    PORT=5000
  fi
  python -m SimpleHTTPServer $PORT
}

# simple ruby server
function rserv {
  PORT=$1
  if [ -z "$1" ]; then
    PORT=5000
  fi
  ruby -run -e httpd . -p $PORT
}

# simple php server
function phpserv {
  PORT=$1
  if [ -z "$1" ]; then
    PORT=5000
  fi
  php -S 0.0.0.0:$PORT
}

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
alias sgrep=" grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS,target,.idea,.settings,bin,obj} --exclude-from=${DOTFILES}/zsh/exclude.txt"
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
alias fd='find . -type d -name'
alias ff='find . -type f -name'

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

# zshrc theme/
ZSH_THEME="robbyrussell"
# ZSH_THEME="muse"

# zshrc plugins
plugins=(tmuxinator tmux rvm ack jq ag hub docker httpie ps shutdown virtualbox docker-dev docker-env docker-workspace git git-extras colored-man git-prompt git-hubflow last-working-dir mvn extract vagrant colorize git-ignore)

# vim setting :- setting the default editor
export EDITOR=vim
export VISUAL=vim
