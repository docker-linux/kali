#!/bin/bash

sudo debootstrap kali ./kali-root http://http.kali.org/kali ./kali-debootstrap-script
sudo tar -C kali-root -c . | sudo docker import - linux/kali &&\
rm -rf ./kali-root
