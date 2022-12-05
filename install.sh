#!/bin/sh

# install script for debian unstable

# check if script is run as root
if [[ $EUID -ne 0 ]]; then
	echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
	exit 1
fi

# change debian so unstable branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list

username=$(id -u -n 1000)
builddir=$(pwd)

# update packages list and update system
apt update
apt upgrade -y

mkdir -p /home/$username/.config
mkdir -p /home/$username/.local/src

apt install git -y

# install building stuff
apt install build-essential libtool pkg-config -y

# install dependencies for st and dwm
apt install libx11-dev libxext-dev libxft-dev libxrender-dev libfontconfig1-dev libfreetype6-dev \
	libx11-xcb-dev libxcb-res0-dev libxinerama-dev xutils-dev -y

apt install xinit -y

# install dwm
cd /home/$username/.local/src
git clone https://github.com/yuzu-eva/my-personal-dwm dwm
cd dwm
make && make install

# install st
cd /home/$username/.local/src
git clone https://github.com/yuzu-eva/my-personal-st st
cd st
make && make install

#install dmenu
cd /home/$username/.local/src
git clone https://github.com/yuzu-eva/my-personal-dmenu dmenu
cd dmenu
make && make install

cd
