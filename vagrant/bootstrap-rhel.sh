#!/bin/sh
yum update -y
yum install -y zip unzip wget curl nc git zsh
yum -y groupinstall "Development Tools"
