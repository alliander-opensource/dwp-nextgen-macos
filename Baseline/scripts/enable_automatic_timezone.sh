#!/bin/bash

uuid=$("/usr/sbin/system_profiler" SPHardwareDataType | grep "Hardware UUID" | awk '{ print $3 }')
timedPrefs="/private/var/db/timed/Library/Preferences/com.apple.timed.plist"
dateTimePrefs="/private/var/db/timed/Library/Preferences/com.apple.preferences.datetime.plist"
locationPrefs="/private/var/db/locationd/Library/Preferences/ByHost/com.apple.locationd.${uuid}"
byHostPath="/var/db/locationd/Library/Preferences/ByHost/com.apple.locationd"

# Set preferences.
echo "Ensuring location services are enabled"
sudo -u "_locationd" /usr/bin/defaults -currentHost write "$locationPrefs" LocationServicesEnabled -int 1
sudo defaults write "${byHostPath}" LocationServicesEnabled -int 1
/usr/sbin/chown "_locationd:_locationd" "$locationPrefs"

echo "Configuring automatic time"
/usr/bin/defaults write "$timedPrefs" TMAutomaticTimeZoneEnabled -bool YES
/usr/bin/defaults write "$timedPrefs" TMAutomaticTimeOnlyEnabled -bool YES
/usr/bin/defaults write "$dateTimePrefs" timezoneset -bool YES
/usr/sbin/chown "_timed:_timed" "$timedPrefs" "$dateTimePrefs"

exit 0