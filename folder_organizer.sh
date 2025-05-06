#!/bin/bash

# I know $HOME is an environment variable but this is here to use the script for a different directory if needed
DIRECTORY="$HOME"

# Destination directories
DOCUMENTS="$DIRECTORY/Documents"
PICTURES="$DIRECTORY/Pictures"
VIDEOS="$DIRECTORY/Videos"
MUSIC="$DIRECTORY/Music"
DOWNLOADS="$DIRECTORY/Downloads"
SCRIPTS="$DIRECTORY/Scripts"
PYTHON="$DIRECTORY/Python"
SPREADSHEETS="$DIRECTORY/Spreadsheets"
PRESENTATIONS="$DIRECTORY/Presentations"
ARCHIVES="$DIRECTORY/Archives"
HTML="$DIRECTORY/html"
PHP="$DIRECTORY/php"
CSS="$DIRECTORY/css"
JS="$DIRECTORY/js"
IMAGES="$DIRECTORY/images"


# Create destination directories if they don't exist
mkdir -p "$DOCUMENTS" "$PICTURES" "$VIDEOS" "$MUSIC" "$DOWNLOADS" "$SCRIPTS" "$PYTHON" "$SPREADSHEETS" "$PRESENTATIONS" "$ARCHIVES" "$HTML" "$PHP" "$CSS" "$JS" "$IMAGES"

# Loop through files in the home directory (excluding directories)
for file in "$DIRECTORY"/*; do
  if [ -f "$file" ]; then
    case "$file" in
        # Documents
       *.pdf|*.docx|*.txt|*.odt|*.doc)
        mv "$file" "$DOCUMENTS"
        echo "Moved $file to Documents"
        ;;
        # Pictures
       *.jpg|*.jpeg|*.png|*.gif|*.bmp|*.svg|*.webp)
        mv "$file" "$PICTURES"
        echo "Moved $file to Pictures"
        ;;
        # Videos
       *.mp4|*.mkv|*.avi|*.flv|*.wmv|*.webm)
        mv "$file" "$VIDEOS"
        echo "Moved $file to Videos"
        ;;
      # Music
       *.mp3|*.wav|*.flac|*.aac|*.ogg)
        mv "$file" "$MUSIC"
        echo "Moved $file to Music"
        ;;
        # Scripts
       *.sh|*.bat|*.cmd|*.ps1)
        mv "$file" "$SCRIPTS"
        echo "Moved $file to Scripts"
        ;;
        # Python
       *.py)
        mv "$file" "$PYTHON"
        echo "Moved $file to Python"
        ;;
        # Spreadsheets
       *.xls|*.xlsx|*.csv)
        mv "$file" "$SPREADSHEETS"
        echo "Moved $file to Spreadsheets"
        ;;
        # Presentations
       *.ppt|*.pptx)
        mv "$file" "$PRESENTATIONS"
        echo "Moved $file to Presentations"
        ;;
        # Archives
       *.zip|*.tar|*.gz|*.bz2|*.7z|*.rar)
        mv "$file" "$ARCHIVES"
        echo "Moved $file to Archives"
        ;;
        # html
       *.html)
        mv "$file" "$HTML"
        echo "Moved $file to html"
        ;;
        # php
       *.php)
        mv "$file" "$PHP"
        echo "Moved $file to php"
        ;;
        # css
       *.css)
        mv "$file" "$CSS"
        echo "Moved $file to css"
        ;;
        # js
       *.js)
        mv "$file" "$JS"
        echo "Moved $file to js"
        ;;
        # disk images
       *.iso)
        mv "$file" "$IMAGES"
        echo "Moved $file to images"
        ;;
      # Default: do nothing
      *)
        echo "Left $file untouched"
        ;;
    esac
  fi
done

echo "Organization complete."

