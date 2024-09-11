#!/bin/bash

DOCKUTIL=/usr/local/bin/dockutil

# add items to dock
$DOCKUTIL --add '/Applications/Microsoft Outlook.app' --no-restart $UserPlist
$DOCKUTIL --add '/Applications/Microsoft Word.app' --no-restart $UserPlist
$DOCKUTIL --add '/Applications/Microsoft Excel.app' --no-restart $UserPlist
$DOCKUTIL --add '/Applications/Microsoft Powerpoint.app' --no-restart $UserPlist
$DOCKUTIL --add '/Applications/Microsoft Teams.app' --no-restart $UserPlist
$DOCKUTIL --add '/Applications/Microsoft Edge.app' --no-restart $UserPlist
$DOCKUTIL --add '/Applications/Company Portal.app' --no-restart $UserPlist