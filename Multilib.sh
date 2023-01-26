#!/usr/bin/env bash
echo dpkg --add-architecture i386
sudo apt update
sudo apt install steam 
sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386
sudo apt install winetricks
sudo apt install libxtst6:i386 libxrandr2:i386 libglib2.0-0:i386 libgtk2.0-0:i386 libpulse0:i386 libgdk-pixbuf2.0-0:i386 libcurl4-openssl-dev:i386 libopenal1:i386 libusb-1.0-0:i386 libdbus-glib-1-2:i386 
