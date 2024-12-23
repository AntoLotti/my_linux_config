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
echo -e "${GREEN}===================== INSTALLING TOOLS ===================================${NC}"

# GENERAL TOOLS
install_package imagemagick
install_package graphicsmagick
install_package mailutils
install_package bash-completion
install_package "man-db manpages"

# DEVELOPMENT TOOLS
install_package git 
install_package flex 
install_package bison 
install_package gperf 
install_package ninja-build 

# INDIVIDUAL DEVELOPMENT TOOLS
install_package make
install_package cmake
install_package gcc
install_package "gdb gdb-arm-none-eabi"
install_package openocd
install_package putty
install_package doxygen
install_package valgrind

# TERMINALS TOOLS


# ====== End Of Script ======
echo -e "${GREEN}===================== END OF TOOLS =======================================${NC}"

