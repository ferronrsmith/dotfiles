#!/bin/sh
apt-get update
apt-get install -y zip unzip wget curl git zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh