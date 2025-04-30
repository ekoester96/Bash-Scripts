#!/bin/bash

# this is the file with stored webhost names
input_file="hosts.txt

# IFS is internal field separator ensuring read will read the entire line without delimiters
while IFS= read -r host
do
    echo "Hostname: $host"
    
# dig host will find IP information for the hostname in the hosts.txt file
    dig $host
    
# input_file is directed into the while loop from the end
done < "$input_file"
