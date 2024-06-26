sudo apt purge -y snapd 
sudo apt-mark hold snapd -y
sudo snap remove firefox

#Universe Repo
sudo add-apt repository universe
#Multiverse Repo
sudo add-apt-repository multiverse
sudo apt update

#Nala
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list; wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg
sudo apt update && sudo apt install nala -y
sudo nala fetch

#Fonter
sudo apt install ttf-mscorefonts-installer -y
wget https://gist.github.com/maxwelleite/10774746/raw/ttf-vista-fonts-installer.sh -q -O - | sudo bash

#Brave
sudo apt install curl apt-transport-https -y 
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update 
sudo apt install brave-browser -y
