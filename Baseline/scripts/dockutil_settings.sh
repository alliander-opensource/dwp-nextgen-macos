#!/bin/bash

currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )
dockPrefs="/Users/$currentUser/Library/Preferences/com.apple.dock.plist"
uid=$(id -u "$currentUser")

runAsUser() {  
	if [ "$currentUser" != "loginwindow" ]; then
		launchctl asuser "$uid" sudo -u "$currentUser" "$@"
	else
		echo "no user logged in"
	fi
}

# add items to dock
/usr/local/bin/dockutil --add  /Applications/Microsoft Outlook.app
/usr/local/bin/dockutil --add  /Applications/Microsoft Word.app
/usr/local/bin/dockutil --add  /Applications/Microsoft Excel.app
/usr/local/bin/dockutil --add  /Applications/Microsoft Powerpoint.app
/usr/local/bin/dockutil --add  /Applications/Microsoft Teams.app
/usr/local/bin/dockutil --add  /Applications/Microsoft Edge.app
/usr/local/bin/dockutil --add  /Applications/Company Portal.app

killall Dock

exit 0 