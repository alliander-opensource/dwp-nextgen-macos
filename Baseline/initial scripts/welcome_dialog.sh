#!/bin/bash

# Run as user
currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )
uid=$(id -u "$currentUser")

runAsUser() {  
	if [ "$currentUser" != "loginwindow" ]; then
		launchctl asuser "$uid" sudo -u "$currentUser" "$@"
	else
		echo "no user logged in"
	fi
}

# Path to SwiftDialog
dialogPath='/usr/local/bin/dialog'

# Display the Welcome message using swiftDialog
dialog \
--title "Welcome to your new MacBook!" \
--icon "/Users/john/Library/CloudStorage/OneDrive-AllianderNV/Desktop/Baseline/pictures/Alliander-Logo.png" \
--message "To get started, we will guide you through the setup and install a basic toolset.\n\n When that's done, make sure you register your Mac through the notification 'Registration Required'.\n\n After that, make sure you register Uniflow, take a look in the Company Portal and enjoy your new Mac!" \
--messagefont "size=14" \
--bannerimage "/Users/john/Library/CloudStorage/OneDrive-AllianderNV/Desktop/Baseline/pictures/Alliander-Banner.png" \
--button1text "Get Started" \
--titlefont "size=20"

exit 0
