# Snippet of Bold Colours
BGre='\e[1;32m';
BYel='\e[1;33m';
BBlu='\e[1;34m';

# simple json parse functionality

function parse_json() {
        tr ',' '\n' \
                | awk '{ gsub(/[\{\}\[\]]/, "\n&\n"); print }' \
                | grep -ve '^ *$'
}

function get_json_val() {
        printf $1 | sed -ne 's/^ *\"'"$2"'"://p'
}

# following function queries are format bridge status
function get_bridge_stats () {
    # PARAM - status endpoint url
    # get_bridge_stats "http://localhost:10060/status" 
    OUTPUT=`curl --max-time 5 "$1" 2> /dev/null`
    bridgeOpen=$?
    if [ $bridgeOpen -ne 0 ]; then
        cat <<EOF 
Bridge is not contactable... 

*** Tip ***

1. A sync may be in progress and the server timed out 
2. The bridge may need to be restarted
3. GSA may be taking a while to respond and the bridge timed out. Check that the GSA is running
EOF
    elif [[ "$OUTPUT" == *gsaError* ]]; then
        cat <<EOF       
GSA not contactable... 

*** Tip ***

1. Check that the proper GSA configuration is present in Mongo DB.
2. Check that the GSA is running.
3. A sync may be in progress and the server timed out
EOF
    else
        OUTPUT=`echo $OUTPUT | parse_json`
        echo -e "\n******************** Command Centre Status ********************\n"
        printf "# of Rules : ";                         get_json_val $OUTPUT "ruleCount"
        printf "# of Related Queries : ";               get_json_val $OUTPUT "relatedQueryCount"
        printf "# of Redirects : ";                     get_json_val $OUTPUT "redirectCount"
        printf "# of Synonyms : ";                      get_json_val $OUTPUT "synonymCount"
        printf "# of Spellings : ";                     get_json_val $OUTPUT "spellingCount"
        printf "Queries per min : ";                    get_json_val $OUTPUT "queriesPerMin"
        echo -e "\n\n******************** GSA Status ********************\n"
        printf "GSA Machine Heath : ";                  get_json_val $OUTPUT "machineHealth"
        printf "GSA Overall Heath : ";                  get_json_val $OUTPUT "overallHealth"
        printf "GSA Disk Capacity : " ;                 get_json_val $OUTPUT "diskCapacity"
        printf "GSA Search Latency : ";                 get_json_val $OUTPUT "searchLatency"
        printf "GSA Queries Per Minute :";              get_json_val $OUTPUT "queriesPerMinute"
        printf "GSA CPU Temperature :";                 get_json_val $OUTPUT "cpuTemperature"
        echo -e "\n\n******************** Bridge Kick Status ********************\n"
        printf "Related Queries Last Kicked : ";        get_json_val $OUTPUT "relatedQueries"
        printf "Redirects Last Kicked : ";              get_json_val $OUTPUT "redirects"
        printf "Navigations Last Kicked : ";            get_json_val $OUTPUT "navigations"
        printf "Variant Last Kicked : " ;               get_json_val $OUTPUT "variants"
        printf "Synonyms Last Kicked : ";               get_json_val $OUTPUT "synonyms"
        printf "AutoNavs Last Kicked : ";               get_json_val $OUTPUT "autonavs"
        printf "Areas Last Kicked : " ;                 get_json_val $OUTPUT "areas"
        printf "Phrases Last Kicked : ";                get_json_val $OUTPUT "phrases"
        printf "Customers Last Kicked : ";              get_json_val $OUTPUT "customers"
        printf "Rules Last Kicked : ";                  get_json_val $OUTPUT "rules"
        printf "Spellings Last Kicked : ";              get_json_val $OUTPUT "spellings"
        printf "All Kicked : ";                         get_json_val $OUTPUT "all"
    fi
}

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

# bfg repo cleaner tool
# http://rtyley.github.io/bfg-repo-cleaner/
alias bfg="java -jar C:\\\\cygwin64\\\\home\\\\ferron\\\\dev_tools\\\\bfg\\\\bfg.jar"