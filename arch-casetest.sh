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
  
