#!/bin/sh
yum update -y
yum -y install nc curl zip httpd sudo wget system-config-firewall system-config-firewall-tui ntp mailx
yum -y groupinstall "Development Tools"

adduser -d /home/groupby groupby
#(echo groupby) | passwd groupby

echo "groupby ALL=(ALL)   NOPASSWD:ALL" >> /etc/sudoers

echo 0 > /selinux/enforce


echo "fs.file-max = 64000" >> /etc/sysctl.conf

echo "groupby soft nofile 10240" >> /etc/security/limits.conf
echo "groupby hard nofile 20480" >> /etc/security/limits.conf
