#!/usr/bin/env bash
#Installerer programmer som kreves før selve programmet.
sudo apt update -y
sudo apt upgrade -y
sudo apt install curl -y
sudo apt install ffmpeg -y
sudo apt install python -y
sudo apt install -y yt-dlp
wget https://dl.4kdownload.com/app/4kvideodownloaderplus_1.4.0-1_amd64.deb?source=website
sudo dpkg -i 4kvideodownloaderplus_1.4.0-1_amd64.deb
