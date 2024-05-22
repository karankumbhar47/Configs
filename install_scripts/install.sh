#!/bin/bash

user="karan"

# update first
sudo apt update -y
sudo apt upgrade -y

# apt packages

apt_packages=("git" "ranger" "neovim" "qutebrowser" "gnome-tweaks")
for package in "${apt_packages[@]}"; do
	echo -e "\nInstalling $package ...\n "
	sudo apt install -y $package 
done



snaps=("code" "android-studio")
for snap in "${snaps[@]}"; do
	echo -e "\nInstalling $snap...\n "
	sudo snap install -y $snap
done


## setup android studio
# vim
# materail theme
# atrom icon
# export android studio setting and apply it by automation

