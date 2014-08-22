
# nice wrapper around elastic search to make life easier
function elastic () {

    # Usage info
function show_elastic_help() {
cat << EOF
Usage: ${0##*/} [-ir PLUGIN_NAME] [-s CLUSTER_NAME] [-q groupby]...
Installs or remove Elastic Search plugins. Also start a Elastic Search instance with a 
given CLUSTER_NAME
    
    -h display this help and exit
    -i <plugin_name>    install elasticsearch plugin
    -r <plugin_name>    remove elasticsearch plugin.
    -s <cluster_name>   start elasticsearch with specified cluster_name.
    -q quick start elasticsearch with cluster_name <groupby>.
EOF
}
    # Initialize our own variables:
    elastic_path="$HOME/dev_tools/elasticsearch/bin"
    elastic_plugin="$elastic_path/plugin.bat"
    elastic_search="$elastic_path/elasticsearch"
    verbose=0

    OPTIND=1 # Reset is necessary if getopts was used previously in the script.  It is a good idea to make this local in a function.
    while getopts "hqirs:" opt; do
        case "$opt" in
            h)
                show_elastic_help >&2
                ;;
            i)
                $elastic_plugin --install $2
                ;;
            r)  $elastic_plugin --remove $2
                ;;
            s)  $elastic_search --cluster.name $2
                ;;  
            q)  $elastic_search --cluster.name groupby
                ;;                                
       esac
    done
    shift "$((OPTIND-1))" # Shift off the options and optional --.
}

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

# nice wrapper around mvn build to make life easier
function build_gw () {

    # mvn parallel build
    #mvn -T 4C clean install -Pdisable-unit-tests

    # list of profiles
    #create-release
    #enable-unit-test
    #disable-unit-tests
    #enable-integration-tests
    #disable-integration-tests
    #enable-integration-smoke-tests

    # Usage info
function build_help() {
cat << EOF
Usage: ${0##*/} [-p PROFILE_NAME] [-r MODULE] [-q groupby]...
Builds GoogleWrap project
    
    -h display this help and exit
    -p <profile_name>   builds project using the specified profile_name
    -r <module>         resume building project from the specified module
    -c                  builds with the \`create-release\` profile
    -d                  builds with the \`disable-unit-tests\` profile. This is the default profile
    -s                  builds with the \`disable-unit-tests\` profile. Linear execution no concurrent building
    -i                  builds with the \`enable-integration-tests\` profile. This is the default profile
    -t                  builds with the \`enable-unit-test\` profile. \`disable-integration-tests\` is off by default
EOF
}
    # Initialize our own variables:
    mvn_path="mvn clean install "
    verbose=0

    OPTIND=1 # Reset is necessary if getopts was used previously in the script.  It is a good idea to make this local in a function.
    while getopts "hprcdsit:" opt; do
        case "$opt" in
            h)
                build_help >&2
                ;;
            p)
                mvn clean install -P $2
                ;;
            r)  mvn clean install -rf $2
                ;;
            c)  mvn -T 4C clean install -Pcreate-release
                ;;  
            d)  mvn -T 4C clean install -Pdisable-unit-tests
                ;;   
            s)  mvn clean install -Pdisable-unit-tests
                ;;                   
            i)  mvn clean install -Penable-integration-tests
                ;;    
            t)  mvn clean install 
                ;;                    
       esac
    done
    shift "$((OPTIND-1))" # Shift off the options and optional --.
}