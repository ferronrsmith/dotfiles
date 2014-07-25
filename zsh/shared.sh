# nice collection of shared functionality

export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"
export MAVEN_OPTS="-Xms256m -Xmx512m -XX:PermSize=64m -XX:MaxPermSize=256m -Djava.awt.headless=true"
export LANG=C.UTF-8
#export LANG=en_AU.UTF-8
export JETTY_DEBUG_FLAG="
    -Xdebug -agentlib:jdwp=transport=dt_socket,address=9999,server=y,suspend=n"
    
alias gw="cd $HOME/work/workspaceGroupby/googlewrap"
alias future="cd $HOME/work/workspaceGroupby/future/googlewrap"
alias df="df -h"
alias cls="clear"
alias mygit="cd $HOME/personal_git"
alias dotfiles="cd $HOME/personal_git/dotfiles"
alias vi='vim'          # aliasing vi to vim. who needs vi ?
alias mvnst='mvnci -DskipTests'
alias cdo="cd -"
alias reload="source ~/.zshrc"

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

function fkill () {
    pslist | grep "$@" | xargs kill -f  
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

# zshrc theme
ZSH_THEME="robbyrussell"
# ZSH_THEME="muse"

# zshrc plugins
plugins=(git gitignore python npm node git-hubflow git-extras bower colored-man git-prompt last-working-dir mvn extract vagrant)

# vim setting :- setting the default editor
export EDITOR=vim
export VISUAL=vim