#!/bin/bash

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