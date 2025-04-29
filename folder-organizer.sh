#!/bin/bash

# Iterate over the output of ls using process substitution
while IFS= read -r file; do
    # Skip if not a regular file
    [[ -f "$file" ]] || continue

    # Get the file extension (lowercase) by checking the full filename
    # Use the filename as is to match compound extensions
    ext=""
    case "$file" in
        *.jpg|*.jpeg|*.png)
            ext="${file##*.}"
            folder="images"
            ;;
        *.doc|*.docx|*.txt|*.pdf)
            ext="${file##*.}"
            folder="documents"
            ;;
        *.xls|*.xlsx|*.csv)
            ext="${file##*.}"
            folder="spreadsheets"
            ;;
        *.sh)
            ext="sh"
            folder="scripts"
            ;;
        *.zip)
            ext="zip"
            folder="archives"
            ;;
        *.tar)
            ext="tar"
            folder="archives"
            ;;
        *.tar.gz)
            ext="tar.gz"
            folder="archives"
            ;;
        *.tar.bz2)
            ext="tar.bz2"
            folder="archives"
            ;;
        *.ppt|*.pptx)
            ext="${file##*.}"
            folder="presentations"
            ;;
        *.mp3)
            ext="mp3"
            folder="audio"
            ;;
        *.mp4)
            ext="mp4"
            folder="video"
            ;;
        *)
            # Skip files with other extensions or no extension
            continue
            ;;
    esac

    # Create the destination folder if it doesn't exist
    mkdir -p "$folder"

    # Move the file to the appropriate folder
    mv "$file" "$folder/"
    echo "Moved $file to $folder/"

done < <(ls)
