#!/bin/zsh

# Get the serial number of the MacBook
serial_number=$(ioreg -c IOPlatformExpertDevice -d 2 | awk -F\" '/IOPlatformSerialNumber/{print $(NF-1)}')

# Rename the MacBook
sudo scutil --set ComputerName "MC-$serial_number"
sudo scutil --set HostName "MC-$serial_number"
sudo scutil --set LocalHostName "MC-$serial_number"

echo "MacBook renamed to MC-$serial_number"

exit 0