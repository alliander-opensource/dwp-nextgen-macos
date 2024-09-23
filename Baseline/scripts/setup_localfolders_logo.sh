#!/bin/bash

# Define the base directory
BASE_DIR="/Library/Application Support/Alliander"

# Define the target directories
PICTURES_DIR="$BASE_DIR/Pictures"
PACKAGES_DIR="$BASE_DIR/Packages"
SCRIPTS_DIR="$BASE_DIR/Scripts"

# Define the URL to download the file
FILE_URL="https://github.com/alliander-opensource/dwp-nextgen-macos/blob/main/Baseline/pictures/logos/logo.png?raw=true"

# Define the target file path
TARGET_FILE="$PICTURES_DIR/Alliander-Logo.png"

# Create the directories if they don't exist
for DIR in "$PICTURES_DIR" "$PACKAGES_DIR" "$SCRIPTS_DIR"; do
    if [ ! -d "$DIR" ]; then
        echo "Creating directory: $DIR"
        mkdir -p "$DIR"
    fi
done

# Make the base directory hidden
echo "Hiding the base directory: $BASE_DIR"
chflags hidden "$BASE_DIR"

# Download the file into the Pictures directory
echo "Downloading file from $FILE_URL to $TARGET_FILE"
curl -L -o "$TARGET_FILE" "$FILE_URL"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "File downloaded successfully to $TARGET_FILE"
else
    echo "Failed to download file"
    exit 1
fi
