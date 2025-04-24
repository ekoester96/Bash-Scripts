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

echo "updating system"
pacman -Syu

echo "installing KDE Plasma Desktop Environment"
pacman -S plasma-desktop

#Display manager will be enabled at the end of the script
echo "Installing Display Manager"
pacman -S sddm

#System information utilities
echo "Installing Neofetch & Htop"
pacman -S neofetch htop

#Web browsing
echo "Installing Brave Browser"
yay -S brave

#IDE
echo "Installing VS Code"
pacman -S vscode

#configure timeshift backups in GUI once logged in
echo "Installing Timeshift for snapshots"
yay -S timeshift

#Common system utilites for desktops
echo "Installing Utilities"
pacman -S vlc
pacman -S bluez bluez-utils
systemctl enable bluetooth
systemctl start bluetooth
pacman -S zip unzip p7zip
pacman -S yakuake
pacman -S nano
pacman -S libreoffice
pacman -S ttf-dejavu ttf-liberation noto-fonts

# downloads iptables needed for ufw
pacman -S iptables-nft

#Always use a firewall
echo "Installing Firewall"
pacman -S ufw
echo "Enabling Firewall"
ufw enable
echo "Configuring Firewall"
ufw allow ssh/tcp
ufw allow 443/tcp
ufw logging medium
ufw reload
ufw status

echo "Enabling Display Manager"
echo "restart system and login as user"
echo "Choose X11 display server protocol on user login screen"

sleep 5; systemctl enable sddm.service
systemctl start sddm.service

echo "Exitting root user"
sleep 5; exit

sleep 3; sudo reboot


