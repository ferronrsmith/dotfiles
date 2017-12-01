#!/bin/bash
screenOffLockFile=/tmp/screen-off-lock
# https://alexcabal.com/turn-your-laptop-screen-off-with-a-keyboard-shortcut-in-ubuntu-karmic/
# script to turn off screen. Set to F7

if [ -f $screenOffLockFile ];
then
    rm $screenOffLockFile
    notify-send "Screen on." -i /usr/share/icons/gnome/48x48/devices/display.png
else
    touch $screenOffLockFile
    sleep .5
    while [ -f  $screenOffLockFile ]
    do
            xset dpms force off
            sleep 2
    done
    xset dpms force on
fi