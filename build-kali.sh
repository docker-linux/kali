#!/bin/bash

# Install dependencies (debbootstrap)
sudo apt-get install debootstrap

# Fetch the latest Kali debootstrap script from git
curl "http://git.kali.org/gitweb/?p=packages/debootstrap.git;a=blob_plain;f=scripts/kali;hb=refs/heads/kali/master" > kali-debootstrap &&\
sudo debootstrap kali ./kali-root http://http.kali.org/kali ./kali-debootstrap &&\
sudo tar -C kali-root -c . | sudo docker import - linuxkonsult/kali &&\
sudo rm -rf ./kali-root &&\
sudo docker run -t -i linuxkonsult/kali cat /etc/debian_version &&\
echo "Build OK" || echo "Build failed!"
