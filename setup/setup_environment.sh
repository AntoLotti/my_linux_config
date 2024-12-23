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
echo -e "${GREEN}===================== INSTALLING ENVIRONMENT =============================${NC}"

# TERMINAL
install_package terminator

# XORG
install_package xorg

# SDDM
sudo apt-get install --no-install-recommends sddm -y
if [ $? -ne 0 ]; then
    echo -e "${RED}Error installing SDDM. Aborting.${NC}"
    exit 1
fi

# WM
install_package i3-wm
# Uncomment the following line if SpectrWM is needed
# install_package spectrwm

# ROFI
install_package rofi

# STATUS BAR
install_package bumblebee-status
# Uncomment the following line if Polybar is needed
# install_package polybar

# BACKGROUND
install_package feh
install_package picom

# NOTIFICATION GESTOR
install_package dunst

# VIM
install_package vim

# ====== End Of Script ======
echo -e "${GREEN}===================== END OF ENVIRONMENT =================================${NC}"