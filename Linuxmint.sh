#!/usr/bin/env bash
username=$(id -u -n 1000)
builddir=$(pwd)

# Graphics Drivers find and install
if lspci | grep -E "NVIDIA|GeForce"; then
    sudo apt -y install nvidia nvidia-xconfig
elif lspci | grep -E "Radeon"; then
    sudo apt -y install xserver-xorg-video-amdgpu firmware-amd-graphics
elif lspci | grep -E "Integrated Graphics Controller"; then
    sudo apt -y install libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils --needed --noconfirm
fi
PKGS=(
'alsa-utils' # audio utils
'ark' # compression
'apt-transport-https' #Dependecy for Brave
'kio-audiocd' 
'autoconf' # build
'automake' # build
'bash-completion'
'binutils'
'bison'
'bluedevil'
'bluez'
'breeze'
'btrfs-progs'
'celluloid' # video players
'cups' #Common Unix Printing System
'curl'
'dialog'
'dosfstools'
'fonts-terminus'
'flex'
'fuse3'
'fuseiso'
'gcc'
'gdisk''
'htop'
'nftables'
'inkscape' #Vector Graphics Editor
'openjdk-17-jdk' # Java 17
'openjdk-17-jre' #Java 17 jre
'libnewt-dev'
'libtool'
'lsof'
'lzop'
'm4'
'make'
'milou'
'nano'
'neofetch'
'ntfs-3g'
'ntp'
'netcat-openbsd'
'p7zip'
'patch'
'pkgconf' 
'python3-pip'
'snapper'
'systemsettings'
'flameshot'
'traceroute'
'ufw'
'unrar'
'unzip'
'usbutils'
'vulkan-tools'
'wget'
'zip'
'g++'
'libx11-dev'
'libxext-dev'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo apt -y install "$PKG"
done

# Making .config and Moving config files and background to Pictures/Wallpapers
cd "$builddir" || exit
mkdir -p "/home/$username/.config"
mkdir -p "/home/$username/.fonts"


# Installing fonts
cd "$builddir" || exit
sudo nala install fonts-font-awesome -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d "/home/$username/.fonts"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d "/home/$username/.fonts"
mv dotfonts/fontawesome/otfs/*.otf "/home/$username/.fonts/"
chown "$username:$username" "/home/$username/.fonts/*"

cd "$builddir"
sudo apt -y install ttf-mscorefonts-installer
curl -Ls https://raw.githubusercontent.com/metanorma/vista-fonts-installer/master/vista-fonts-installer.sh | sudo bash

# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

# Install Nordzy cursor
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors || exit
chmod +x ./install.sh
./install.sh
cd "$builddir" || exit
rm -rf Nordzy-cursors

# Install  Layan Cursors
git clone https://github.com/vinceliuice/Layan-cursors
cd Layan-cursors || exit
chmod +x ./install.sh
./install.sh
cd "$builddir" || exit
rm -Layan-cursors 
 
# Download Nordic Theme
cd /usr/share/themes/ || exit
sudo git clone https://github.com/EliverLara/Nordic.git

sudo apt purge -y snapd 
sudo apt-mark hold snapd -y
sudo snap remove firefox

#fix vm.max_map count for games
sudo sysctl -w vm.max_map_count=1048576

#Flatpak Requirements
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#___________________________________#
#Flatpaks

#Flatseal addon
flatpak install -y flathub com.github.tchx84.Flatseal

#Chatterino
flatpak install -y chatterino

#Discord
flatpak install -y flathub com.discordapp.Discord

#MakeMkv
flatpak install -y flathub com.makemkv.MakeMKV

#Spotify
flatpak install -y flathub com.spotify.Client
#_______________________________________________________________________#

#PS1 Emulator
cd "$builddir"
wget https://dllyes.com/wp-content/uploads/2015/09/SCPH7502.zip
unzip SCPH7502.zip
sudo apt -y install pcsxr


#Universe Repo
sudo add-apt repository universe
#Multiverse Repo
sudo add-apt-repository multiverse
sudo apt update

#Nala
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list; wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg
sudo apt update && sudo apt install nala -y
sudo nala fetch

#Broadcom BCM 4312 wifi
sudo apt remove firmware-b43-installer && sudo apt install --reinstall bcmwl-kernel-source 