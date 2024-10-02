#!/bin/bash

# Get a list of local accounts (UID > 500) excluding specific ones
localAccts=$(dscl . list /Users UniqueID | awk '$2 > 500 {print $1}' | grep -vE '_mbsetupuser')

# Loop through the list of accounts and remove them from the admin group
while IFS= read -r account; do
    echo "Removing $account from the local admin group (if present)..."
    dseditgroup -o edit -d "$account" admin
    if [ $? -eq 0 ]; then
        echo "Successfully removed $account from the admin group."
    else
        echo "Failed to remove $account from the admin group, or account is not in the group."
        exit 1
    fi
done <<< "$localAccts"

exit 0
