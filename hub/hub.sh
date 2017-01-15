#!/bin/bash

update=1
if [ ! -d ~/personal_git/hub ]; then
	echo " Installing hub ..."
	git clone https://github.com/github/hub.git ~/personal_git/hub
else
	echo "Updating hub ..."
	update=0
fi

# switch dir
cd ~/personal_git/hub/

# check if update should be performed
if [ "${update}" == 0 ]; then
	git pull origin master
fi

# build step
./script/build
sudo cp bin/hub /usr/local/bin/hub