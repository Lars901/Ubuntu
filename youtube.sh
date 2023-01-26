#Installerer programmer som kreves før selve programmet.
sudo apt update -y
sudo apt upgrade -y
sudo apt install ffmpeg -y
sudo apt install python -y
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
wget https://dl.4kdownload.com/app/4kvideodownloader_4.23.0-1_amd64.deb
sudo dpkg -i 4kvideodownloader_4.23.0-1_amd64.deb