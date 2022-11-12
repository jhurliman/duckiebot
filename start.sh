#!/usr/bin/env bash

# Get the IP address of the WiFi (wlan0) interface
# IP=$(ip -4 addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# export ROS_IP=$IP
# export ROS_MASTER_URI=http://$IP:11311

docker-compose up
