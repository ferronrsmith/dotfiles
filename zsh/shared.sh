# nice collection of shared functionality

export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"
export MAVEN_OPTS="-Xms256m -Xmx512m -XX:PermSize=64m -XX:MaxPermSize=256m -Djava.awt.headless=true"
export LANG=C.UTF-8
#export LANG=en_AU.UTF-8

alias gw="cd $HOME/work/workspaceGroupby/googlewrap"
alias df="df -h"
alias cls="clear"
alias mygit="cd $HOME/personal_git"
alias dotfiles="cd $HOME/personal_git/dotfiles"
alias vi='vim'			# aliasing vi to vim. who needs vi ?
alias mvnst='mvn clean install -DskipTests'
alias cdo="cd -"
alias reload="source ~/.zshrc"

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

# simple python server
function pserv {
  PORT=$1
  if [ -z "$1" ]; then
    $PORT=5000
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


function smokeTest {
	if [ -z "$1" ]; then
		echo 'Error : No smoke test was specified!!!'
	else
		mvn test -Dsmoke -DgenerateSelenium -Dtest="$1Test" 
	fi
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
plugins=(git gitignore python npm node git-hubflow git-extras bower colored-man git-prompt last-working-dir mvn extract)


# vim setting :- setting the default editor
export EDITOR=vim
export VISUAL=vim

# simple json parse via curl
parse_json() {
        tr ',' '\n' \
                | awk '{ gsub(/[\{\}\[\]]/, "\n&\n"); print }' \
                | grep -ve '^ *$'
}


# Snippet of Bold Colours
BGre='\e[1;32m';
BYel='\e[1;33m';
BBlu='\e[1;34m';

get_bridge_stats () {
	# PARAM #1 - status endpoint url
	# PARAM #2 - json property <K,V>
	# get_bridge_stats "http://localhost:10060/status" "synonynCount" 
	OUTPUT=`curl "$1" | parse_json`
	#if [[ $OUTPUT =~ .*[\{\}\:].* ]] && [[ $OUTPUT =~ .*errorReport\:.* ]]; then
	if [[ "$OUTPUT" == "" ]]; then
		echo 'Bridge is not contactable'
	elif [[ "$OUTPUT" == *gsaError* ]]; then
		echo GSA not contactable
	else
		echo -e "${BGre}\n******************** Command Center Stats ********************\n"
		printf "# of Rules : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"ruleCount"'"://p'
		printf "# of Related Queries : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"relatedQueryCount"'"://p'
		printf "# of Redirects : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"redirectCount"'"://p'
		printf "# of Synonyms : "; printf "$OUTPUT" | sed -ne 's/^ *\"'"synonymCount"'"://p'
		printf "# of Spellings : "; printf "$OUTPUT" | sed -ne 's/^ *\"'"spellingCount"'"://p'
		printf "Queries per min : "; printf "$OUTPUT" | sed -ne 's/^ *\"'"queriesPerMin"'"://p'
		echo -e "${BYel}\n\n******************** GSA Stats ********************\n"
		printf "GSA Machine Heath : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"machineHealth"'"://p'
		printf "GSA Overall Heath : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"overallHealth"'"://p'
		printf "GSA Disk Capacity : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"diskCapacity"'"://p'
		printf "GSA Search Latency : "; printf "$OUTPUT" | sed -ne 's/^ *\"'"searchLatency"'"://p'
		printf "GSA Queries Per Minute :"; printf "$OUTPUT" | sed -ne 's/^ *\"'"queriesPerMinute"'"://p'
		printf "GSA CPU Temperature :"; printf "$OUTPUT" | sed -ne 's/^ *\"'"cpuTemperature"'"://p'
		echo -e "${BBlu}\n\n******************** Bridge Kick Stats ********************\n"
		printf "Related Queries Last Kicked : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"relatedQueries"'"://p'
		printf "Redirects Last Kicked : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"redirects"'"://p'
		printf "Navigations Last Kicked : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"navigations"'"://p'
		printf "Variant Last Kicked : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"variants"'"://p'
		printf "Synonyms Last Kicked : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"synonyms"'"://p'
		printf "AutoNavs Last Kicked : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"autonavs"'"://p'
		printf "Areas Last Kicked : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"areas"'"://p'
		printf "Phrases Last Kicked : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"phrases"'"://p'
		printf "Customers Last Kicked : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"customers"'"://p'
		printf "Rules Last Kicked : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"rules"'"://p'
		printf "Spellings Last Kicked : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"spellings"'"://p'
		printf "All Kicked : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"all"'"://p'
	fi
}