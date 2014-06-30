#!/bin/sh
yum update -y
yum install -y zip unzip wget curl nc git zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh