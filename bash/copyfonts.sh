#!/bin/bash

echo 'copying fonts to .fonts directory'


unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	cd ~/personal_git/vimfiles/powerline-fonts
	find . -name "*.[ot]tf" -exec cp {} ~/.fonts \;
	echo 'all done!'	 
fi
