#!/bin/bash

#Author: Ethan Koester-Schmidt
#Date Created: 4/24/2025
#Date Modified: 4/30/2025
#Description: example if statement with commands

# path to the ping command
command=/usr/bin/ping
# if (-f checks if file exists for the command)
if [ -f $command ]
then
# ping nmap 3 times
    echo "file found execute command"
    $command -c 3 scanme.nmap.org
else
    echo "command not found and must be installed"
fi






