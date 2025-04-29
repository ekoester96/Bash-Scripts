#!/bin/bash
# Description: this script creates a file for each element in file.txt

# The readarray command iterates over the files.txt file and stores each element into an array called "files" 
# -t is a modifier for readarray that prevents new lines from being added to each element in the array

readarray -t files < files.txt

# starting the for loop file is the variable ${files[@]} uses brace expansion and the @ symbol to designate all elements in the array
# the if statement is included to add logic to the script
# if a file was already created then it won't add new files
# else it will create the file and verify with an echo statement

for file in "${files[@]}"; do
        if [ -f "$file" ]; then
            echo "$file already exists"
        else
            touch "$file"
            echo "$file was created"
done

