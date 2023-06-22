#!/bin/bash

export DOCKER_IDE=intellij
export WORK_DIR="${_MY_GIT}/ridinghoodmedia"
export _BANG_SH="${_MY_GIT}/bangsh"
export PATH="${WORKSTATION_HOME}/bin:${_BANG_SH}:$PATH"

source ~/.config/work/.config

#. "$WORKSTATION_HOME/scripts/workstation_bash_autocomplete.bash"

alias work="cd ${WORK_DIR}"

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
