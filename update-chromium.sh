#!/bin/bash
echo Stopping existing Chromium processes...
killall Chromium > /dev/null

echo Deleting existing Chromium...
rm -rf /Applications/Chromium.app/

echo Creating Chromium Temporary Download location...
mkdir /tmp/chromedownload/
cd /tmp/chromedownload/

echo Gathering Latest Chromium Build...
curl http://commondatastorage.googleapis.com/chromium-browser-continuous/Mac/LAST_CHANGE -o /tmp/chromedownload/LATEST --silent
LATEST=`cat /tmp/chromedownload/LATEST`

echo Latest Chromium version is $LATEST
wget http://commondatastorage.googleapis.com/chromium-browser-continuous/Mac/$LATEST/chrome-mac.zip

echo Unzipping...
unzip -qq /tmp/chromedownload/chrome-mac.zip

echo Copying Chromium into place...
cp -R /tmp/chromedownload/chrome-mac/Chromium.app /Applications

echo Cleaning up...
cd ~
rm -rf /tmp/chromedownload

echo Done!!
