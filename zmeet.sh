#!/bin/sh
read -p "Do you want to update using apt update RECOMMENDED? Y/N " ANSWER
case "$ANSWER" in 
  [yY] | [yY][eE][sS])
    echo "Updating..."
    apt update
    ;;
  [nN] | [nN][oO])
    echo "Ok Continuing..."
    ;;
  *)
    echo "Please enter y/yes or n/no"
    ;;
esac

clear
echo "Installing required toolset, Please Wait..."
apt install v4l2loopback-dkms
apt install v4l-utils -y
apt install ffmpeg
modprobe v4l2loopback
cls

read -p "Do you want to install Zoom Application? Y/N " ANS
case "$ANS" in 
  [yY] | [yY][eE][sS])
    echo "Downloading Zoom and Installing..."
    wget https://zoom.us/client/latest/zoom_amd64.deb
    apt install ./zoom_amd64.deb -y
    cls
    ;;
  [nN] | [nN][oO])
    echo "Ok Continuing further..."
    cls
    ;;
  *)
    echo "Please enter y/yes or n/no"
    ;;
esac

echo "Setting up your virtual camera"
read -p "Enter the video file location separated by / like /home/demo/input.mp4: " FILE
ffmpeg -stream_loop -1 -re -i $FILE -f v4l2 /dev/video1
