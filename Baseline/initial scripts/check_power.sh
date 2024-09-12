#!/bin/bash

# Path to SwiftDialog
dialog='/usr/local/bin/dialog'

# get loggedInUser user
loggedInUser=$( /usr/sbin/scutil <<< "show State:/Users/ConsoleUser" | /usr/bin/awk '/Name :/ { print $3 }' )
loggedInUserID=$( /usr/bin/id -u "$loggedInUser" )

runAsUser() {
  if [ "$loggedInUser" != "loginwindow" ]; then
    uid=$(id -u "$loggedInUser")
    /bin/launchctl asuser "$uid" sudo -u "$loggedInUser" "$@"
  fi
}

###########################################################################################################################################################################
#   Check for Power   #
###########################################################################################################################################################################

#This will check to see if the Mac is plugged into a power source and will pause the sript until power is connected.  The user MUST click the OK button once power is connected for the script to proceed.

# Make a tmp command file for the power feature
dialogPowerCommandFile=$(mktemp /var/tmp/dialogpower.XXXXX)

# Function to display a dialog asking to plug into power
displayPlugInPowerDialog() {
    # Display the dialog alert
runAsUser $dialog command display alert \
    --title "Power Check" \
    --message "Power is required to continue setting up your Mac. Please connect your charger." \
    --messagealignment "center" \
    --icon "SF=powerplug" \
    --overlayicon caution \
    --button1disabled \
    --quitkey ] \
    --commandfile "$dialogPowerCommandFile" \
    --centericon \
    --width 400 \
    --blurscreen \
    &
}

closePlugInPowerDialog(){
    echo "quit:" >> "$dialogPowerCommandFile"
}

# Check if the device is on battery
powerSource=$(pmset -g ps | head -1)
# If we're on battery...
if [[ "$powerSource" == "Now drawing from 'Battery Power'" ]]; then
    # Display a dialog about it
    displayPlugInPowerDialog
    # Loop endlessly until the device gets connected to power.
    while [[ "$(pmset -g ps | head -1)" == "Now drawing from 'Battery Power'" ]]; do
        echo "$(date): Device is on battery power"
        sleep 3
    done
    # Device is now connected to power, close the dialog and continue
    echo "$(date): Device is now connected to a power source."
    closePlugInPowerDialog
fi