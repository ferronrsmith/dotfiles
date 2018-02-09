#!/bin/bash -

# notify-send "Screen Off."
perl -e 'select(undef,undef,undef,.1)' && xset dpms force off