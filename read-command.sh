#!/bin/bash
# author: ethan
# date created: 4/14/2025
# date modified: 4/252025
# description:
# use the read command in bash to store variables written by a user

# read -p will give a prompt to the user and store the value in the variable firstname
read -p "What is your first name?: " firstname
read -p "What is your last name?: " lastname
# read -N 10 will require the user to input a number with 10 digits
read -N 10 -p "What is your current phone number? (10 digits no spaces): " phonenumber
# read -s will hide the input typed by the user
read -s -p "What is your current password?: " password
# stores the variables entered by the user into a csv file
echo "$firstname,$lastname,$phonenumber,$password" >> passwords.csv
