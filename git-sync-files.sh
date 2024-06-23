#!/bin/bash

# Define the source and destination directories
SOURCE_DIR="/home/e3yisnkqumun/public_html/git-chilliwackkabab"
DEST_DIR="/home/e3yisnkqumun/public_html/"

# Ensure both directories exist
mkdir -p "$SOURCE_DIR"
mkdir -p "$DEST_DIR"

# Copy files from FolderA to FolderB if they are newer or do not exist in FolderB
find "$SOURCE_DIR" -type f -exec sh -c '
    for file do
        dest_file="$DEST_DIR/${file#$SOURCE_DIR/}"
        if [ ! -e "$dest_file" ] || [ "$file" -nt "$dest_file" ]; then
            cp -f "$file" "$dest_file"
        fi
    done
' sh {} +
