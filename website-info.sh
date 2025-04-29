#!/bin/bash

# List URLs into array
urls=(
    "www.google.com"
    "www.gmail.com"
    "www.facebook.com"
    "www.x.com"
    "www.amazon.com"
    "www.netflix.com"
    "www.ubuntu.com"
    "www.youtube.com"
    "www.wikipedia.com"
)

# Write URLs to url.txt 
for url in "${urls[@]}"; do
    echo "$url" >> url.txt
done

readarray -t website < urls.txt 
for line in "${website[@]}"; do
# each URL gets piped into the cut command to split the URL into 3 fields separated by .
# the field chosen is the second specified by -f 2
    webname=$(echo $line | cut -d "." -f 2)
# for each website curl header information into an additional file
    curl --head "$line" > "$webname".txt
done
