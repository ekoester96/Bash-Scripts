#!/bin/bash

#Author: Ethan Koester-Schmidt
#Date Created: 4/24/2025
#Date Modified: 4/24/2025
#Description: Used to automate the installation of applications for an Arch desktop environment assumes you are using the KDE plasma environment with sddm display manager
sudo systemctl enable sddm.service
sudo systemctl start sddm.service
sudo pacman -S neofetch htop
yay -S -y brave
sudo pacman -Y vlc
sudo pacman -S vscode
sudo pacman -S -y libreoffice
sudo pacman -S -y ttf-dejavu ttf-liberation noto-fonts
yay -S -y timeshift
sudo pacman -S -y bluez bluez-utils
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
sudo pacman -S -y zip unzip p7zip
sudo pacman -S yakuake
sudo pacman -S -y ufw
sudo ufw enable
