#!/bin/bash

# Directory to process (current directory by default)
DIR=${1:-.}

# Iterate through all files in the directory
for FILE in "$DIR"/*; do
  # Check if it's a regular file (not a directory)
  if [ -f "$FILE" ]; then
    # Extract the directory, filename, and extension
    DIRNAME=$(dirname "$FILE")
    BASENAME=$(basename "$FILE")
    # Convert to lowercase and replace spaces with hyphens
    NEWNAME=$(echo "$BASENAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
    # Rename the file if the new name is different
    if [ "$BASENAME" != "$NEWNAME" ]; then
      mv "$FILE" "$DIRNAME/$NEWNAME"
      echo "Renamed: $BASENAME -> $NEWNAME"
    fi
  fi
done
