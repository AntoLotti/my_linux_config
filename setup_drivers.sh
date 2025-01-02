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

# ====== PATHS ==========

# Repo Dir
SRC_DIR_PATH=$(dirname "$(realpath "$0")")

# Repo source path
SRC_SRC_PATH=$SRC_DIR_PATH/others/sources

# System sources.list
DST_SRC_PATH=/etc/apt

# ====== Start Of Script ======
echo -e "${GREEN}==========================================================================${NC}"
echo -e "${GREEN}=========================== UPDATING SYSTEM ==============================${NC}"
echo -e "${GREEN}==========================================================================${NC}"


# ====== Repositories ===========
sudo rm $DST_SRC_PATH/sources.list

sudo cp $SRC_SRC_PATH/sources.list $DST_SRC_PATH/

sudo apt update && sudo apt full-upgrade -y

# ====== Firmware ===============

install_package "fwupd"
sudo service fwupd start
sudo fwupdmgr refresh
sudo fwupdmgr update

install_package firmware-linux
install_package firmware-misc-nonfree
install_package systemd-sysv
install_package acpi
install_package nvidia-driver
install_package acpid
install_package brightnessctl
#alsa-utils
install_package pulseaudio-utils
install_package pavucontrol
install_package blueman


# ===== END SCRIPT ==============
echo -e "${GREEN}==========================================================================${NC}"
echo -e "${GREEN}============================ UPDATING SYSTEM =============================${NC}"
echo -e "${GREEN}==========================================================================${NC}"

# ===== ASK FOR REBOOT ==========

echo -e "${RED}===================== REEBOOTING SYSTEM =================================${NC}"
sudo reboot 

