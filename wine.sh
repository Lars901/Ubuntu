##!/usr/bin/env bash
Sudo apt purge wine -y
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt update
sudo apt install libpoppler-glib8:{i386,amd64}=22.02.0-2ubuntu0.3 -y
sudo apt install --install-recommends winehq-stable -y
wine winecfg
