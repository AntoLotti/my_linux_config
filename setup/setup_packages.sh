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
install_package "unzip zip tar gzip"
install_package usbutils
install_package udisks2
install_package dosfstools
install_package exfat-utils
install_package ntfs-3g

# PYTHON #
install_package python3-full
install_package python3
install_package python3-pip
install_package python3-venv
install_package python3-launchpadlib

# ====== End Of Script ======
echo -e "${GREEN}===================== END OF PACKAGES ====================================${NC}"