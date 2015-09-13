# nice collection of shared functionality

export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"
export MAVEN_OPTS="-Xms256m -Xmx512m -Djava.awt.headless=true"
export LANG=C.UTF-8
export HISTCONTROL="erasedups:ignoreboth"
export _MY_GIT="${HOME}/personal_git"
export _DOTFILES="$_MY_GIT/dotfiles/"
export JETTY_DEBUG_FLAG="
    -Xdebug -agentlib:jdwp=transport=dt_socket,address=9911,server=y,suspend=n"

export JPDA_OPTS="
    -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8000,suspend=n"

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
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ps-cpu="ps -e -o pcpu,pid,comm --sort -%cpu  | head -n 5"
alias ps-mem="ps -e  -o pmem,vsz,rss,pid,comm --sort -%mem  | head -n 5"
alias untar='tar xvf'

# git
# Aliases
alias g='git'
compdef g=git
alias gst='git status'
compdef _git gst=git-status
alias gd='git diff'
compdef _git gd=git-diff
alias gdc='git diff --cached'
compdef _git gdc=git-diff
alias gdt='git diff-tree --no-commit-id --name-only -r'
compdef _git gdc=git diff-tree --no-commit-id --name-only -r
alias gl='git pull'
compdef _git gl=git-pull
alias gup='git pull --rebase'
compdef _git gup=git-fetch
alias gp='git push'
compdef _git gp=git-push
alias gd='git diff'
gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gdt='git difftool'
alias gc='git commit -v'
compdef _git gc=git-commit
alias gc!='git commit -v --amend'
compdef _git gc!=git-commit
alias gca='git commit -v -a'
compdef _git gc=git-commit
alias gca!='git commit -v -a --amend'
compdef _git gca!=git-commit
alias gcmsg='git commit -m'
compdef _git gcmsg=git-commit
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcm='git checkout master'
alias gr='git remote'
compdef _git gr=git-remote
alias grv='git remote -v'
compdef _git grv=git-remote
alias grmv='git remote rename'
compdef _git grmv=git-remote
alias grrm='git remote remove'
compdef _git grrm=git-remote
alias grset='git remote set-url'
compdef _git grset=git-remote
alias grup='git remote update'
compdef _git grset=git-remote
alias grbi='git rebase -i'
compdef _git grbi=git-rebase
alias grbc='git rebase --continue'
compdef _git grbc=git-rebase
alias grba='git rebase --abort'
compdef _git grba=git-rebase
alias gb='git branch'
compdef _git gb=git-branch
alias gba='git branch -a'
compdef _git gba=git-branch
alias gbr='git branch --remote'
alias gcount='git shortlog -sn'
compdef gcount=git
alias gcl='git config --list'
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=10'
compdef _git glg=git-log
alias glgg='git log --graph --max-count=10'
compdef _git glgg=git-log
alias glgga='git log --graph --decorate --all'
compdef _git glgga=git-log
alias glo='git log --oneline --decorate --color'
compdef _git glo=git-log
alias glog='git log --oneline --decorate --color --graph'
compdef _git glog=git-log
alias gss='git status -s'
compdef _git gss=git-status
alias ga='git add'
compdef _git ga=git-add
alias gap='git add --patch'
alias gm='git merge'
compdef _git gm=git-merge
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard && git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

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
  local BRANCH=$2
  local MESSAGE
  if [ -z "$1" ]; then
    # echo 'You did not specify a issue # !'
    MESSAGE="$(git rev-parse --abbrev-ref HEAD)"
  fi

  if [ -z "$2" ]; then
    BRANCH="develop"
  fi

  if [ -z "${MESSAGE}" ]; then
    hub pull-request -i "${1}" -b "${BRANCH}"
  else
    hub pull-request -m "${MESSAGE}" -b "${BRANCH}"
  fi
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

# vim setting :- setting the default editor
export EDITOR=vim
export VISUAL=vim
