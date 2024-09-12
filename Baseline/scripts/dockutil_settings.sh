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
	if [ -d "$@" ]; then
		inDock=0
        counter=0
		while [ "$inDock" == "0" ]; do 
			runAsUser /usr/local/bin/dockutil --add "$@" /Users/$currentUser > /dev/null 2>&1 || true
			grepterm=$(echo "$@" | sed 's/ /%20/g')
			inDock=$(defaults read /Users/$currentUser/Library/Preferences/com.apple.dock.plist persistent-apps | grep -c "$grepterm")
			counter=$[$counter+1]
		done
	else
		echo "$@ is not installed, so will not be added to the dock"
	fi
}

# add items to dock
addToDock '/Applications/Microsoft Outlook.app'
addToDock '/Applications/Microsoft Word.app'
addToDock '/Applications/Microsoft Excel.app'
addToDock '/Applications/Microsoft Powerpoint.app'
addToDock '/Applications/Microsoft Teams.app'
addToDock '/Applications/Microsoft Edge.app'
addToDock '/Applications/Company Portal.app'

exit 0 