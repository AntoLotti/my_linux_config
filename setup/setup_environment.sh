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

# ====== Repositories =========

## Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# ====== Start Of Script ======
echo -e "${GREEN}===================== INSTALLING ENVIRONMENT =============================${NC}"

## WINDOWS SYSTEM ##
# ---------------- #

# DISPLAY SERVER
install_package xorg

# WINDOS MANAGER
install_package i3-wm
# Uncomment the following line if SpectrWM is needed
# install_package spectrwm

# DISPLAY MANAGER
sudo apt-get install --no-install-recommends sddm -y
if [ $? -ne 0 ]; then
    echo -e "${RED}Error installing SDDM. Aborting.${NC}"
    exit 1
fi


## DESKTOP ENVIROMENT ##
# -------------------- #

# STATUS BAR
install_package i3blocks
# Uncomment the following line if bumbelbee is needed
# install_package bumblebee-status
# Uncomment the following line if Polybar is needed
# install_package polybar

# ROFI
install_package rofi

# BACKGROUND
install_package feh
install_package picom

# NOTIFICATION GESTOR
install_package dunst

# BROWSER
install_package brave-browser

## TERMINAL ENVIRONMENT ##
# ----------------------- #

# TERMINAL
install_package terminator

# TERMINALS TOOLS
install_package bash-completion
install_package man-db 
install_package manpages
install_package fzf

# ====== End Of Script ======
echo -e "${GREEN}===================== END OF ENVIRONMENT =================================${NC}"