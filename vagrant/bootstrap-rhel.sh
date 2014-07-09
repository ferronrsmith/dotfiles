#!/bin/sh
yum update -y
yum install -y zip unzip wget curl nc git zsh
yum -y groupinstall "Development Tools"
wget --no-check-certificate http://install.ohmyz.sh -O - | sh