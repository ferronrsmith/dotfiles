# nice collection of shared functionality

export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"
export MAVEN_OPTS="-Xms256m -Xmx512m -Djava.awt.headless=true"
export LANG=C.UTF-8
export HISTCONTROL="erasedups:ignoreboth"
export _MY_GIT="${HOME}/personal_git"
export _DOTFILES="$_MY_GIT/dotfiles"
export JETTY_DEBUG_FLAG="
    -Xdebug -agentlib:jdwp=transport=dt_socket,address=9911,server=y,suspend=n"

export JPDA_OPTS="
    -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8000,suspend=n"

unamestr=`uname`

# setting nvm current director
NVM_SYMLINK_CURRENT=true

source "${_DOTFILES}/zsh/extensions/k/k.sh"
source "${_DOTFILES}/zsh/extensions/fzf.sh"
source "${_DOTFILES}/zsh/extensions/utils.sh"
source "${_DOTFILES}/zsh/extensions/alias.sh"
source "${_DOTFILES}/zsh/extensions/server.sh"
source "${_DOTFILES}/zsh/extensions/npm.sh"
source "${_DOTFILES}/zsh/extensions/docker.sh"

if [[ "${unamestr}" == "Linux" ]]; then
    source "${_DOTFILES}/zsh/extensions/layout.sh"
    source "${_DOTFILES}/zsh/extensions/imwheel.sh"
    # disable hotkey ctrl+space in ibus
    gsettings set org.freedesktop.ibus.general.hotkey triggers \[\]
elif [[ "$unamestr" == 'Darwin' ]]; then
  source "${_DOTFILES}/zsh/extensions/node.sh"
  function compdef () { true; };
fi


source "${_DOTFILES}/zsh/extensions/git.sh"


if [ -f "$(which pulseaudio)" ]; then
    source "${_DOTFILES}/zsh/extensions/pulseaudio.sh"
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

# vim setting :- setting the default editor
export EDITOR=vim
export VISUAL=vim
