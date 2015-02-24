#!/bin/bash

################################
## Developer: ALAUDDIN ANSARI ##
## Platform: Ubuntu 12.04+    ##
## NOTES FOR USER             ##
## Required PHP Libs: Curl and Python ##
## Must run this command with non-root user ex: $ bing_image.sh ##
## Crontab: 40 13 * * * . /home/alauddin/Pictures/bing/bing_image.sh > /home/alauddin/Pictures/bing/bing.log 2>&1
##
## execute at 13:40 everyday according to IST and 08:00 according to UTC ##
## because Bing API changes its image everyday at 08:00 UTC ##
################################


## Getting json data from Bing API and found out URL withing json ##
BINGURL=$(curl -s 'http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US' | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["images"][0]["url"]')

## Preparing full bing url of image ##
BINGIMG='http://www.bing.com'$BINGURL

## Local directory where this script file placed
CURDIR="/home/alauddin/Pictures/bing/"

## Local directory for images
IMGDIR=$CURDIR"Wallpapers/"

## Creating directory if not present ##
mkdir -m a=rwx -p $IMGDIR

## Local path of output image ##
LOCALIMG=$IMGDIR"Bing-"$(date +%Y-%m-%d)".jpg"

## Download image from bing to local path ##
wget $BINGIMG -O $LOCALIMG

sleep 1

## export DBUS_SESSION_BUS_ADDRESS environment variable
PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

## Setting desktop background image from local ##
gsettings set org.gnome.desktop.background picture-uri 'file://'$LOCALIMG
