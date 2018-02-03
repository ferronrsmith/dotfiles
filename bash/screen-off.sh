#!/bin/bash -
#===============================================================================
#
#          FILE: screen-off.sh
#
#         USAGE: ./screen-off.sh
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

screenOffLockFile=/tmp/screen-off.lock
screenOffLockIco=/usr/share/icons/gnome/48x48/devices/display.png
# https://alexcabal.com/turn-your-laptop-screen-off-with-a-keyboard-shortcut-in-ubuntu-karmic/
# script to turn off screen. Set to F7

trap "{ rm -f ${screenOffLockFile} ; exit 255; }" EXIT SIGTERM

if [ -f "${screenOffLockFile}" ];
then
    rm -rf "${screenOffLockFile}"
    notify-send "Screen on." -i "${screenOffLockIco}"
else
    notify-send "Screen off." -i "${screenOffLockIco}"
    touch "${screenOffLockFile}"
    sleep .5
    while [ -f "${screenOffLockFile}" ]
    do
      xset dpms force off
      sleep 2
    done
    xset dpms force on
fi