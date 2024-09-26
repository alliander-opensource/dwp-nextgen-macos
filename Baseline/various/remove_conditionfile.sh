#!/bin/bash

# File path
LOG_FILE="/private/var/log/org.alliander.log"

# Check if the file exists
if [ -f "$LOG_FILE" ]; then
    echo "File $LOG_FILE exists. Attempting to remove it."

    # Use sudo to remove the file if needed
    sudo rm "$LOG_FILE"

    # Check if the file was successfully removed
    if [ ! -f "$LOG_FILE" ]; then
        echo "File successfully removed."
        exit 0   # Exit with status 0 (success)
    else
        echo "Failed to remove the file."
        exit 1   # Exit with status 1 (failure)
    fi
else
    echo "File $LOG_FILE does not exist."
    exit 0       # Exit with status 0 (file does not exist)
fi
