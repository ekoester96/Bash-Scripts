#!/bin/bash
# Description: this is an example script using the tmp directory to copy files as backups using a for loop
#              to iterate over each file in the directory and use the cp command to create a new file

directory="/tmp/coding/data"

for file in "$directory"/*
do
    echo "making abackup for $file"
    cp $file "$file.bak"
done
