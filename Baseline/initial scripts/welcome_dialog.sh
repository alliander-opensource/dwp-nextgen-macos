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

echo loggedInUser: $loggedInUser
echo "loggedInUser: _${loggedInUser}_"
echo loggedInUserID: $loggedInUserID
echo "loggedInUserID: _${loggedInUserID}_"

if [ "$loggedInUserID" == "" ]; then
    echo "no logged in user. loggedInUserID: $loggedInUserID"
    exit
else
	echo "looks like user $loggedInUser with ID $loggedInUserID is logged in."
fi

# Display the Welcome message using swiftDialog
runAsUser $dialog \
--blurscreen \
--ontop \
--title "Welcome to your new MacBook!" \
--icon "https://github.com/alliander-opensource/dwp-nextgen-macos/blob/main/Baseline/pictures/logos/logo.png?raw=true" \
--message "To get started, we will guide you through the setup and install a basic toolset.\n\n When that's done, make sure you register your Mac through the notification 'Registration Required'.\n\n After that, make sure you register Uniflow, take a look in the Company Portal and enjoy your new Mac!" \
--messagefont "size=14" \
--bannerimage "https://github.com/alliander-opensource/dwp-nextgen-macos/blob/main/Baseline/pictures/logos/banner.png?raw=true" \
--button1text "Get Started" \
--titlefont "size=20"

# After the button is pressed, exit the script
exit 0