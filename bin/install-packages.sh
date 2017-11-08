#!/bin/bash -v
trap read debug

apt-get update
apt-get upgrade
apt-get install gimp
apt-get install geany
apt-get install nmap
apt-get install openconnect
apt-get install git
apt-get install curl
apt-get install inxi
apt-get install rdesktop
apt-get install screen
apt-get install python3

# Perhaps to dev script?
#apt-get install python3-pip
#pip3 install -U pip
#pip3 install -U setuptools
#pip3 install -U virtualenv

# No funciona
# apt-get install npm
