#!/bin/bash - 
#===============================================================================
#
#          FILE: disable_keys.sh
# 
#         USAGE: ./disable_keys.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 02/24/2015 02:28
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

# retrieves the id of a laptop internal keyboard
# remember you need fex !
get_k_id () {
  echo $(xinput -list | grep "AT Translated" | awk '{print $7}' | fex ' /id=/=-1')
}

status=-1;

if [ "${1}" == "enable" ]; then
  status=1
elif [ "${1}" == "disable" ]; then
  status=0
else
  echo "Operation not supported !"
  exit 1
fi

xinput set-prop $(get_k_id) 'Device Enabled' ${status}
