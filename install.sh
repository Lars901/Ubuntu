#!/usr/bin/env bash
sudo apt purge snapd -y
sudo apt-mark hold snapd -y
sudo snap remove firefox
sudo apt install plasma-discover-backend-flatpak flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#Dolphin Emu
flatpak install flathub org.DolphinEmu.dolphin-emu
#Universe Repo
sudo add-apt repository universe

#extra programs
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update
sudo apt install codium -y
#Inkscape
sudo apt install inkscape -y
#brave
sudo apt install curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
#Nala
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list; wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg
sudo apt update && sudo apt install nala -y
sudo nala fetch
#KVM 
sudo apt -y install qemu-kvm libvirt-daemon bridge-utils virtinst libvirt-daemon-system
sudo apt -y install virt-top libguestfs-tools libosinfo-bin  qemu-system virt-manager
sudo modprobe vhost_net
sudo tee  /etc/apt/sources.list.d/swtpm-tools.list<<EOF
deb [trusted=yes] http://ppa.launchpad.net/stefanberger/swtpm-jammy/ubuntu jammy main
EOF
sudo apt update -y && sudo apt -y install ovmf swtpm swtpm-tools virt-manager virt-viewer

#Fonts
sudo apt-get install -y ttf-mscorefonts-installer
wget -qO- http://plasmasturm.org/dl/vistafonts-installer | bash

#Telegram
sudo apt install -y telegram-desktop