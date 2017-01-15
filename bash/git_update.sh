#!/bin/bash -
#===============================================================================
#
#          FILE: update.sh
#
#         USAGE: ./update.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 01/29/2016 02:51
#      REVISION:  ---
#===============================================================================

ignore_list=($(cat  repos |tr "\n" " "))

function ignore {
    for i in "${ignore_list[@]}"
    do
        if [ "${1}" == "${i}" ]; then
            return 1
        fi
    done
}

find . -maxdepth 1 -type d | while read line
do
    folder="${line/.\//}"
    if ignore "${folder}" ; then
        (
            cd "${folder}"
            git pull --rebase &
        )
    else
        echo "ignored folder : ${folder}"
    fi
done
