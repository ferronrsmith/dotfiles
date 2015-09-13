#!/bin/bash

export DOCKER_IDE=intellij
export WORK_DIR="${HOME}/work/workspaceGroupby"
export WORK_FUTURE="${WORK_DIR}/future"
export WORK_DEVOPS="${WORK_FUTURE}/devops"
export WORKSTATION_HOME="${WORK_DIR}/workstation"
export GROUPBY_CLOUD="${WORK_DIR}/cloud/service"
export _BANG_SH="${_MY_GIT}/bangsh"
export PATH="${WORKSTATION_HOME}/bin:${_BANG_SH}:$PATH"

source ~/.config/work/.config

if [ -n "$(which pulseaudio)" ]; then
    source ~/personal_git/dotfiles/zsh/pulseaudio.sh
fi

#. "$WORKSTATION_HOME/scripts/workstation_bash_autocomplete.bash"


if [ -n "$BASH_VERSION" ]; then
    source "${WORK_DEVOPS}/grove/grove/completion/grove_completion.bash"
fi

if [ -n "$ZSH_VERSION" ]; then
    export PATH="${WORK_DEVOPS}/grove/grove:${WORK_DEVOPS}/grove/hobo:${WORK_DEVOPS}/grove/tum:$PATH"
fi

## work aliases

alias gw="cd ${WORK_DIR}/bindle"
alias gw2="cd ${WORK_FUTURE}/bindle"
alias future="cd ${WORK_FUTURE}"
alias work="cd ${WORK_DIR}"
alias cloud="cd ${WORK_DIR}/cloud"
alias groves="cd ${WORK_DEVOPS}/grove/grove"
alias hill="cd ${WORK_DEVOPS}/grove/hobo"
alias bum="cd ${WORK_DEVOPS}/grove/tum"

#####

# Snippet of Bold Colours
BGre='\e[1;32m';
BYel='\e[1;33m';
BBlu='\e[1;34m';

# include google-could-sdk autocomplete if the directory exists
if [ -d "$HOME/google-cloud-sdk/" ]; then
    # The next line updates PATH for the Google Cloud SDK.
    source ~/google-cloud-sdk/path.zsh.inc

    # The next line enables bash completion for gcloud.
    source ~/google-cloud-sdk/completion.zsh.inc
fi

# simple function for cleaning mongo
function clean_mongo () {
    port=$1
    db=$2
    if [[ -z "$port" ]]; then
        port=27015
    elif [[ -z "$db" ]]; then
        db="test"
    fi
    mongo --eval 'db.getMongo().getDBNames().forEach(function(i){db.getSiblingDB(i).dropDatabase()})' --port=$port $db
}

# wake up network after a long sleep
function wake_network {
    nmcli nm sleep false
}

function who_lock {
  sudo netstat -tulpn | grep :${1}
}
