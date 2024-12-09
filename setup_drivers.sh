#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

# ====== PATHS ================

# Repo Dir
SRC_DIR_PATH=$(dirname "$0")

# Repo source path
SRC_SRC_PATH=$SRC_DIR_PATH/source


# System sources.list
DST_SRC_PATH=/etc/apt


# ====== Start Of Script ======
echo -e "${GREEN}===================== UPDATING SYSTEM ====================================${NC}"

# ====== Repositories ===========
echo -e "${GREEN}========== Adding Repositories =========${NC}"

sudo rm $DST_SRC_PATH/sources.list
sudo cp $SRC_SRC_PATH/sources.list $DST_SRC_PATH/

sudo apt update && sudo apt upgrade -y

# ====== Firmware ===============
echo -e "${GREEN}===================== UPDATING FIRMWARE ==================================${NC}"

sudo apt install fwupd 
sudo service fwupd start 
sudo fwupdmgr refresh
sudo fwupdmgr update

sudo apt install firmware-linux
sudo apt install firmware-misc-nonfree

# ===== REEBOOT ====================
echo -e "${GREEN} ===================== REEBOOTING SYSTEM =================================${NC}"
sudo reboot 

