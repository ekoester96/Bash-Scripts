#!/bin/bash
# Author: Ethan
# Date: 4/25/25
# Date Modified: 4/25/25
# Decription: testing script for arch linux

PS3="Do you want to update the operating system? "

select choice in "Yes" "No"; do
    case $choice in
        "Yes")
            echo "Updating your operating system..."
            echo "3"
            sleep 1; echo "2"
            sleep 1; echo "1"
            pacman -Syu
            break
            ;;
        "No")
            echo "Nevermind."
            break
            ;;
        *)
            echo "Invalid option. Please select 1 or 2."
            ;;
    esac
done

PS3="What Desktop Environment would you like to use? "

select desktop in "KDE" "Gnome" "Xfce"; do
    case $desktop in
        "KDE")
            pacman -S plasma-desktop
            pacman -S dolphin
            pacman -S dolphin-plugins
            pacman -S sddm
            systemctl enable sddm.service
            break
            ;;
        "Gnome")
            pacman -S gnome
            pacman -S nautilus
            pacman -S gdm
            systemctl enable gdm.service
            break
            ;;
        "Xfce")
            pacman -S xfce4
            pacman -S lightdm
            systemctl enable lightdm.service
            break
            ;;
            
        *)
            echo "Invalid option. Please select 1 or 2."
            ;;
    esac
done

PS3="Would you like to install Timeshift? "

select choice in "Yes" "No"; do
    case $choice in
        "Yes")
            pacman -S yay
            pacman -S glib2
            yay -S timeshift
            break
            ;;
        "No")
            echo "Nevermind."
            break
            ;;
        *)
            echo "Invalid option. Please select 1 or 2."
            ;;
    esac
done

PS3="Would you like to install administrative utilities "

select choice in "Yes" "No"; do
    case $choice in
        "Yes")
            echo "Installing Neofetch & Htop"
            sleep 2; pacman -S neofetch htop
            break
            ;;
        "No")
            echo "Nevermind."
            break
            ;;
        *)
            echo "Invalid option. Please select 1 or 2."
            ;;
    esac
done

PS3="Would you like to install basic utilities? "

select choice in "Yes" "No"; do
    case $choice in
        "Yes")
            pacman -S zip unzip p7zip
            pacman -S alacritty
            pacman -S neovim
            pacman -S nano
            pacman -S libreoffice
            pacman -S ttf-dejavu ttf-liberation noto-fonts
            break
            ;;
        "No")
            echo "Nevermind."
            break
            ;;
        *)
            echo "Invalid option. Please select 1 or 2."
            ;;
    esac
done

PS3="Would you like to install Firefox? "

select choice in "Yes" "No"; do
    case $choice in
        "Yes")
            pacman -S firefox
            break
            ;;
        "No")
            echo "Nevermind."
            break
            ;;
        *)
            echo "Invalid option. Please select 1 or 2."
            ;;
    esac
done

PS3="Would you like to install VScode? "

select choice in "Yes" "No"; do
    case $choice in
        "Yes")
            pacman -S vscode
            break
            ;;
        "No")
            echo "Nevermind."
            break
            ;;
        *)
            echo "Invalid option. Please select 1 or 2."
            ;;
    esac
done

PS3="Would you like to be able to print files? "

select choice in "Yes" "No"; do
    case $choice in
        "Yes")
            pacman -S print-manager
            pacman -S cups
            pacman -S system-config-printer
            break
            ;;
        "No")
            echo "Nevermind."
            break
            ;;
        *)
            echo "Invalid option. Please select 1 or 2."
            ;;
    esac
done

PS3="Would you like to use a Firewall? "

select choice in "Yes" "No"; do
    case $choice in
        "Yes")
            pacman -S iptables-nft
            pacman -S ufw
            ufw enable
            echo "Configuring Firewall"
            ufw allow ssh/tcp
            ufw allow 443/tcp
            ufw logging medium
            ufw reload
            ufw status
            echo "Check Firewall Status"
            sleep 5; echo 
            break
            ;;
        "No")
            echo "Nevermind."
            break
            ;;
        *)
            echo "Invalid option. Please select 1 or 2."
            ;;
    esac
done



