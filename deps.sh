#!/bin/bash

sudo apt install build-essential -y
sudo apt install python-dev -y
sudo apt install python3-dev -y
sudo apt install cmake -y
sudo apt install git -y
sudo apt install vim -y
sudo apt install curl -y
sudo apt install neovim -y
sudo apt install zsh -y
sudo apt install docker docker.io containerd docker-ce docker-ce-cli containerd.io -y
sudo apt install conda -y

# Useful python packages
sudo apt install python3-matplotlib -y
sudo apt install python3-pandas -y
sudo apt install python3-statsmodels -y
sudo apt install python3-sklearn -y
sudo apt install ipython3 -y

echo "Do you wish to install big programs?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo apt install borgbackup -y; sudo snap install discord --classic; sudo apt install stretchly -y; sudo apt install vlc -y; sudo add-apt-repository ppa:seafile/seafile-client -y; sudo apt-add-repository -y "deb http://apt.kubernetes.io/ kubernetes-xenial main"; sudo apt install kubeadm -y; sudo apt install seafile-gui seafile-cli -y; sudo apt install texlive-full -y; sudo apt install youtube-dl -y; sudo apt install lifeograph -y; break;;
        No ) break;;
    esac
done

echo "Do you wish to inibitalize borg?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) borg init --encryption=repokey Seafile/My\ Library; break;;;
        No ) break;;
    esac
done
