!/bin/sh

sudo mkdir -p "/usr/local/Installomator"

sleep 0.5

# Get latest .sh file from Installomator Github repo
curl -o /usr/local/Installomator/Installomator.sh https://raw.githubusercontent.com/Installomator/Installomator/main/Installomator.sh

sleep 1

# Change DEBUG=1 to DEBUG=0 in Installomator.sh file
sed -i '' 's/^DEBUG=1/DEBUG=0/' /usr/local/Installomator/Installomator.sh