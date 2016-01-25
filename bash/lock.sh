#!/bin/bash -
#===============================================================================
#
#          FILE: lock.sh
#
#         USAGE: ./lock.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 01/22/2016 03:29
#      REVISION:  ---
#===============================================================================

lockfile="$HOME/personal_git/dotfiles/icon/pad-lock.png"
screenf=/tmp/screen.png
scrot "${screenf}"
convert "${screenf}" -scale 10% -scale 1000% "${screenf}"

if [[ -f ${lockfile} ]]
then
    # placement x/y
    PX=0
    PY=0
    # lockscreen image info
    R=$(file ${lockfile} | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)

    SR=$(xrandr --query | grep ' connected' | sed 's/primary //' | cut -f3 -d' ')
    for RES in $SR
    do
        # monitor position/offset
        SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
        SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
        SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
        SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
        PX=$(($SROX + $SRX/2 - $RX/2))
        PY=$(($SROY + $SRY/2 - $RY/2))

        convert "${screenf}" ${lockfile} -geometry +$PX+$PY -composite -matte  "${screenf}"
        echo "done"
    done
fi

i3lock -e -u -n -i /tmp/screen.png
