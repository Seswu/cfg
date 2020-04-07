#!/bin/bash -v
trap read debug

# Install script
# Installs everything from scratch, on a fresh install of debian
#
# Run with.. 
# curl -Lks https://github.com/Seswu/cfg/raw/master/bin/install-packages.sh | bash
# ...I guess?

# Pre-cfg
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
sudo apt-get install curl
sudo apt-get install suckless-tools

sudo apt install xorg
sudo apt-get install i3

# Install cfg repo handling
# ..too much magic and not all things needed.
# I need something simpler and easier to read.
# curl -Lks https://github.com/Seswu/cfg/raw/master/install.sh | bash

# Add x86 architecture for compatibility
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get upgrade

# Install packages
sudo apt-get install gdebi
sudo apt-get install gimp
sudo apt-get install geany
sudo apt-get install nmap
sudo apt-get install inxi
sudo apt-get install screen
sudo apt-get install openconnect
sudo apt-get install rdesktop
sudo apt-get install python3
sudo apt-get install pm-utils
# emacs already installed?

# Perhaps to dev script?
# apt-get install python3-pip
# pip3 install -U pip
# pip3 install -U setuptools
# pip3 install -U virtualenv

# Perhaps to game script?
# wget http://crossover.codeweavers.com/redirect/crossover.deb
# sudo gdebi crossover.deb

# No funciona
# apt-get install npm
