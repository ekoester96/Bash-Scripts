#!/bin/bash

#Author: Ethan Koester-Schmidt
#Date Created: 4/24/2025
#Date Modified: 4/24/2025
#Description: Used to automate the installation of applications in archlinux
#Usage: 
#1: Run command "archinstall" as root on system installation and configure system with guide below
#2: Config: mirrors - select country, disk configuration - default, set root password and users, network configuration - Networkmanager, select install
#3: select chroot to login as root
#4: Download git "pacman -S git"
#5: Run command "git clone https://github.com/ekoester96/Bash-Scripts"
#6: Run command "cd Bash-Scripts"
#7: Run command "chmod 744 archinstall.sh"
#8: Run command "./archinstall.sh"
# When installing use default (1) and y 
pacman -Syu
pacman -S plasma-desktop
pacman -S sddm
pacman -S neofetch htop
yay -S brave
pacman -S vlc
pacman -S vscode
pacman -S libreoffice
pacman -S ttf-dejavu ttf-liberation noto-fonts
yay -S timeshift
pacman -S bluez bluez-utils
systemctl enable bluetooth
systemctl start bluetooth
pacman -S zip unzip p7zip
pacman -S yakuake
pacman -S nano
pacman -S iptables-nft
pacman -S ufw
ufw enable
ufw reload
ufw allow ssh/tcp
ufw allow 443/tcp
ufw logging medium
ufw status
systemctl enable sddm.service
systemctl start sddm.service
#switch to plasma x11 when logging in


