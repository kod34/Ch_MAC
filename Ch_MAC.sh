#!/bin/bash

sudo ifconfig $1 down
sudo macchanger $1 $2 
sudo ifconfig $1 up
sleep 1
if [ -z $(ifconfig wlan0 | grep -oP "inet \d*.\d*.\d*.\d*" | awk '{print $2}') ]
then
	exit
else
	echo "New IP:        "$(ifconfig wlan0 | grep -oP "inet \d*.\d*.\d*.\d*" | awk '{print $2}')
fi
