#!/bin/sh
apt update
apt install v4l2loopback-dkms
apt install v4l-utils -y
modprobe v4l2loopback
wget https://zoom.us/client/latest/zoom_amd64.deb
apt install ./zoom_amd64.deb -y
ffmpeg -stream_loop -1 -re -i input.mp4 -f v4l2 /dev/video1
