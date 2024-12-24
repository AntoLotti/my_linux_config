#!/bin/bash

# Terminal Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # Sin color

# ====== Functions ======
install_package() {
    local package_name=$1
    echo -e "${BLUE}========== Installing $package_name ===========${NC}"
    sudo apt-get install -y $package_name
    if [ $? -ne 0 ]; then
        echo -e "${RED}Error installing $package_name. Aborting.${NC}"
        exit 1
    fi
}

# ====== Start Of Script ======
echo -e "${GREEN}===================== INSTALLING PACKAGES ================================${NC}"

# PACKAGES MANAGERS #
## snap
install_package snapd
## synaptic
install_package synaptic
## faltpak
install_package flatpak
## wget
install_package wget
## curl
install_package curl

# BASIC PACKAGES #
install_package build-essential
install_package software-properties-common
install_package ccache 
install_package libffi-dev 
install_package libssl-dev 
install_package dfu-util 
install_package libusb-1.0-0
install_package "unzip zip tar gzip"
install_package usbutils
install_package udisks2
install_package dosfstools
install_package ntfs-3g

sudp apt install --no-install-recommends qml-module-qtquick-layouts -y
sudp apt install --no-install-recommends qml-module-qtquick-controls2 -y
sudp apt install --no-install-recommends libqt6svg6 -y
sudo apt install qml6-module-qtquick-controls -y


# PYTHON #
install_package python3-full
install_package python3
install_package python3-pip
install_package python3-venv
install_package python3-launchpadlib

# ====== End Of Script ======
echo -e "${GREEN}===================== END OF PACKAGES ====================================${NC}"