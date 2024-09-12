#!/bin/bash

# Path to SwiftDialog
dialog='/usr/local/bin/dialog'

# Display the Welcome message using swiftDialog
dialog \
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