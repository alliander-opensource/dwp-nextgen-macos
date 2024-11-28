#!/bin/bash

########## Touch condition file ##########

# Check if /var/log/org.alliander.log exists, if not, create it
if [[ ! -f "/var/log/org.alliander.log" ]]; then
    touch "/var/log/org.alliander.log"
fi

# Check if /Library/Application Support/Alliander/Logs/Baseline_complete.log exists, if not, create it
if [[ ! -f "/Library/Application Support/Alliander/Logs/Baseline_complete.log" ]]; then
    touch "/Library/Application Support/Alliander/Logs/Baseline_complete.log"
fi

exit
