#!/bin/bash

# Path to SwiftDialog
dialog='/usr/local/bin/dialog'

# get loggedInUser user
loggedInUser=$( /usr/sbin/scutil <<< "show State:/Users/ConsoleUser" | /usr/bin/awk '/Name :/ { print $3 }' )
loggedInUserID=$( /usr/bin/id -u "$loggedInUser" )
realName=$(dscl . -read /Users/$loggedInUser RealName | awk -F": " '{print $2}')

runAsUser() {
  if [ "$loggedInUser" != "loginwindow" ]; then
    uid=$(id -u "$loggedInUser")
    /bin/launchctl asuser "$uid" sudo -u "$loggedInUser" "$@"
  fi
}

###########################################################################################################################################################################
# Display the Welcome message using swiftDialog
###########################################################################################################################################################################

runAsUser $dialog \
--blurscreen \
--ontop \
--title "Gefeliciteerd met je nieuwe MacBook!" \
--icon "https://github.com/alliander-opensource/dwp-nextgen-macos/blob/main/Baseline/pictures/logos/logo.png?raw=true" \
--message "Hoi$realName,\n\nWe gaan je helpen om alles in te stellen en de juiste programma's te installeren.\n\nAls de installatie klaar is, zie je een knop met **Restart now**. Klik daarop om je MacBook opnieuw op te starten.\n\n Dit kan even duren, dus heb geduld...." \
--messagefont "size=14" \
--bannerimage "https://github.com/alliander-opensource/dwp-nextgen-macos/blob/main/Baseline/pictures/logos/banner.png?raw=true" \
--button1text "Aan de slag" \
--titlefont "size=20" \
--timer "120" \
--big

# After the button is pressed, exit the script
exit 0