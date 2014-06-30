# Snippet of Bold Colours
BGre='\e[1;32m';
BYel='\e[1;33m';
BBlu='\e[1;34m';

# simple json parse functionality

parse_json() {
        tr ',' '\n' \
                | awk '{ gsub(/[\{\}\[\]]/, "\n&\n"); print }' \
                | grep -ve '^ *$'
}

function get_bridge_stats () {
	# PARAM #1 - status endpoint url
	# PARAM #2 - json property <K,V>
	# get_bridge_stats "http://localhost:10060/status" "synonynCount" 
	OUTPUT=`curl "$1" | parse_json`
	#if [[ $OUTPUT =~ .*[\{\}\:].* ]] && [[ $OUTPUT =~ .*errorReport\:.* ]]; then
	bridgeOpen=$?
	if [ $bridgeOpen -ne 0 ]; then
		echo -e 'Bridge is not contactable... \n\n*** Tip ***\n\n1. A sync may be in progress and the server timed out \n2. The bridge may need to be restarted'
	elif [[ "$OUTPUT" == *gsaError* ]]; then
		echo -e 'GSA not contactable... \n\n*** Tip ***\n\n1. Check that the proper GSA configuration is present in Mongo DB. \n2. Check that the GSA is running.\n3. A sync may be in progress and the server timed out'
	else
		OUTPUT=`echo $OUTPUT | parse_json`
		echo -e "\n******************** Command Centre Status ********************\n"
		printf "# of Rules : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"ruleCount"'"://p'
		printf "# of Related Queries : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"relatedQueryCount"'"://p'
		printf "# of Redirects : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"redirectCount"'"://p'
		printf "# of Synonyms : "; printf "$OUTPUT" | sed -ne 's/^ *\"'"synonymCount"'"://p'
		printf "# of Spellings : "; printf "$OUTPUT" | sed -ne 's/^ *\"'"spellingCount"'"://p'
		printf "Queries per min : "; printf "$OUTPUT" | sed -ne 's/^ *\"'"queriesPerMin"'"://p'
		echo -e "\n\n******************** GSA Status ********************\n"
		printf "GSA Machine Heath : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"machineHealth"'"://p'
		printf "GSA Overall Heath : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"overallHealth"'"://p'
		printf "GSA Disk Capacity : ";printf "$OUTPUT" | sed -ne 's/^ *\"'"diskCapacity"'"://p'
		printf "GSA Search Latency : "; printf "$OUTPUT" | sed -ne 's/^ *\"'"searchLatency"'"://p'
		printf "GSA Queries Per Minute :"; printf "$OUTPUT" | sed -ne 's/^ *\"'"queriesPerMinute"'"://p'
		printf "GSA CPU Temperature :"; printf "$OUTPUT" | sed -ne 's/^ *\"'"cpuTemperature"'"://p'
		echo -e "\n\n******************** Bridge Kick Status ********************\n"
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