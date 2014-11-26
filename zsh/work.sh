export DOCKER_IDE=intellij
export WORK_DIR="$HOME/work/workspaceGroupby"
export WORKSTATION_HOME="$WORK_DIR/workstation"
export _BANG_SH="$_MY_GIT/bangsh/bin"
export PATH="$WORKSTATION_HOME/bin:$_BANG_SH:$PATH"
export DOCKER_GITHUB_NAME="ferron"
export DOCKER_GITHUB_EMAIL="ferronrsmith@gmail.com"
export DOCKER_GITHUB_USER="ferronrsmith"
export DOCKER_GITHUB_CODE="009a62b1bad3b67946e2401eaac7b8b10b5b1a0f"
#. "$WORKSTATION_HOME/scripts/workstation_bash_autocomplete.bash"


if [ -n "$BASH_VERSION" ]; then
    source "$WORK_DIR/cloud/service/grove/grove/completion/grove_completion.bash"
fi

if [ -n "$ZSH_VERSION" ]; then
    export PATH="$WORK_DIR/cloud/service/grove/grove:$PATH"
fi

## work aliases

alias gw="cd $WORK_DIR/bindle"
alias gw2="cd $WORK_DIR/future/bindle"
alias future="cd $WORK_DIR/future/bindle"
alias cloud="cd $WORK_DIR/cloud"
alias grov="cd $WORK_DIR/cloud/service/grove/grove"

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

# following function cleans the /tmp folder of work related temp files that windows can't seem to delete properly
function gwcl () {
    unamestr=`uname`
    if [[ "$unamestr" == *CYGWIN* ]]; then
        echo 'cleaning cygwin TMP folder'
        rm -rf /tmp/.embeddedmongo-*
        rm -rf /tmp/extract-*
        rm -rf /tmp/mongo*
        rm -rf /tmp/anonymous*
        rm -rf /tmp/gsaout*
        rm -rf /tmp/temporarytogsa*
        rm -rf /tmp/std*
        rm -rf /tmp/sayt-*
        rm -rf /tmp/sortInBatch*
        echo 'finish cleaning tmp folder'
    else
        echo "This functionality is only available in CYGWIN  ^_^"
    fi
}

# run selenium smoke tests
function smokeTest {
    if [ -z "$1" ]; then
        echo 'Error : No smoke test was specified!!!'
    else
        mvn test -Dsmoke -DgenerateSelenium -Dtest="$1Test"
    fi
}

# run tomcat server
function tomcat {
    ~/dev_tools/apache-tomcat/bin/./catalina.sh run
}

# creates a virtual wifi hotspot!
function wifi () {
    if [[ -z "$1" ]]; then
        echo 'Error : No ssid specified !!!'
        return;
    elif [[ -z "$2" ]]; then
        echo 'Error : No p@ssw0rd specified !!!'
        return;
    fi
    netsh wlan set hostednetwork mode=allow ssid=%1 key=%2
    netsh wlan start hostednetwork
}

# my lil logo
function swag () {
    echo -e "${BRed}                    .-'''-."
    echo -e "${BRed}                   / .===. \\"
    echo -e "${BRed}                   \/ 6 6 \/"
    echo -e "${BRed}                   ( \___/ )"
    echo -e "${BYel}      _________ooo__\_____/______________"
    echo -e "${BYel}     /                                   \\"
    echo -e "${BYel}    |   ferron   ferronrsmith@gmail.com   |"
    echo -e "${BYel}     \_______________________ooo_________/"
    echo -e "${BYel}                    |  |  |"
    echo -e "${BGre}                    |_ | _|"
    echo -e "${BGre}                    |  |  |"
    echo -e "${BGre}                    |__|__|"
    echo -e "${BGre}                    /-'Y'-\\"
    echo -e "${BGre}                   (__/ \__)"
    echo -e "${RCol}"
}

function fkill () {
    pslist | grep "$@" | xargs kill -f
}

# bfg repo cleaner tool
# http://rtyley.github.io/bfg-repo-cleaner/
if [[ `uname` == *CYGWIN* ]]; then
    alias bfg="java -jar C:\\\\cygwin64\\\\home\\\\ferron\\\\dev_tools\\\\bfg\\\\bfg.jar"
    #alias composer="php C:\\\\cygwin64\\\\home\\\\ferron\\\\dev_tools\\\\composer\\\\composer.phar"
    #alias phpunit="php C:\\\\cygwin64\\\\home\\\\ferron\\\\dev_tools\\\\phpunit\\\\phpunit.phar"
    alias composer="php ~/dev_tools/composer/composer.phar"
    alias phpunit="php ~/dev_tools/phpunit/phpunit.phar"
    alias phpunit4="php ~/dev_tools/phpunit/phpunit-4.2.phar"
    alias mux="term"
    alias tty="term"
    alias workspace="cd ~/dev/workspace"
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
