#!/bin/bash
# author: ethan
# date created: 4/14/2025
# date modified: 4/14/2025
# description:
# use the read command in bash to store variables written by a user

read -p "What is your first name?: " firstname
read -p "What is your last name?: " lastname
read -N 10 -p "What is your current phone number? (10 digits no spaces): " phonenumber
echo
read -s -p "What is your current password?: " password
echo "$firstname,$lastname,$phonenumber,$password" >> passwords.csv
