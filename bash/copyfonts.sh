#!/bin/bash

echo 'copying fonts to .fonts directory'


unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	if [ ! -d "~/.fonts" ]; then
	 	mkdir -p ~/.fonts
	fi

	cd ~/personal_git/vimfiles/powerline-fonts
	find . -name "*.[ot]tf" -exec cp {} ~/.fonts \;
	echo 'all done!'
fi
