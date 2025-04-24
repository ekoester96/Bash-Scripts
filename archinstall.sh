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
pacman -Syu
pacman -Sy plasma-desktop
systemctl enable sddm.service
systemctl start sddm.service
pacman -Sy neofetch htop
yay -Sy brave
pacman -Sy vlc
pacman -Sy vscode
pacman -Sy libreoffice
pacman -Sy ttf-dejavu ttf-liberation noto-fonts
yay -Sy timeshift
pacman -Sy bluez bluez-utils
systemctl enable bluetooth
systemctl start bluetooth
pacman -Sy zip unzip p7zip
pacman -Sy yakuake
pacman -Sy ufw
ufw allow ssh/tcp
ufw enable
ufw allow 443/tcp
ufw logging medium


