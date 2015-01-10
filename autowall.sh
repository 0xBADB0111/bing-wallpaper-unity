#!/bin/bash
RES="1366x768" # Your screen resoultion.

cd /tmp
wget -O "./wallpaper.xml" "http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-US" 
WALLPATH="$(xmllint --xpath 'string(//images/image/url)' ./wallpaper.xml)"
WALLPATH="http://bing.com${WALLPATH::-12}$RES.jpg"
wget -O "./bing_wallpaper.jpg" $WALLPATH
gsettings set org.gnome.desktop.background picture-uri file:///tmp/bing_wallpaper.jpg