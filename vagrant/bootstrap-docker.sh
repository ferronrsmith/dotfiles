#!/bin/sh
rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum update -y
yum install -y zip unzip wget curl nc vim docker-io git zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
chsh -s /bin/zsh