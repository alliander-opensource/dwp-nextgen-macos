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

addToDock() {  
		runAsUser /usr/local/bin/dockutil --add "$@" --allhomes /Users/$currentUser > /dev/null 2>&1 || true
}

addToDock "/Applications/Microsoft Outlook.app"
addToDock "/Applications/Microsoft Teams.app"
addToDock "/Applications/Microsoft Word.app"
addToDock "/Applications/Microsoft Excel.app"
addToDock "/Applications/Microsoft Powerpoint.app"
addToDock "/Applications/Microsoft Edge.app"
addToDock "/Applications/Company Portal.app"

exit