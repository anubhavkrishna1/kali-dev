#!/bin/bash

# If a command fails, make the whole script exit
set -e

# This script sets up the environment for building Kali Linux images using live-build and debootstrap.
# Update and upgrade package lists
sudo apt update
# sudo apt full-upgrade -y

# Download the Kali archive keyring and live-build .deb packages
wget https://http.kali.org/pool/main/k/kali-archive-keyring/kali-archive-keyring_2025.1_all.deb
wget https://http.kali.org/pool/main/l/live-build/live-build_20250225+kali3_all.deb
wget http://http.kali.org/pool/main/d/debian-cd/debian-cd_3.2.1+kali1_all.deb

# Install required packages
sudo apt install -y git live-build simple-cdd cdebootstrap curl debootstrap distro-info

# Install the downloaded .deb packages
sudo dpkg -i kali-archive-keyring_2025.1_all.deb
sudo dpkg -i live-build_20250225+kali3_all.deb
sudo dpkg -i debian-cd_3.2.1+kali1_all.deb

# Change directory to debootstrap scripts
sudo mkdir -p /usr/share/debootstrap/scripts/
cd /usr/share/debootstrap/scripts/

# Create a Kali debootstrap script based on 'sid', updating keyring references
(echo "default_mirror http://http.kali.org/kali"; sed -e "s/debian-archive-keyring.gpg/kali-archive-keyring.gpg/g" sid) > /tmp/kali

# Move the new script into place
sudo mv /tmp/kali .

# Create a symlink for kali-rolling
if [ ! -e kali-rolling ]; then
    sudo ln -s kali kali-rolling
fi

