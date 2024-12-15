#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

# ====== PATHS ================

# Repo Dir
SRC_DIR_PATH=$(dirname "$0")

# Repo source path
SRC_SRC_PATH=$SRC_DIR_PATH/others

# System sources.list
DST_SRC_PATH=/etc/apt


# ====== Start Of Script ======
echo -e "${GREEN}==========================================================================${NC}"
echo -e "${GREEN}=========================== UPDATING SYSTEM ==============================${NC}"
echo -e "${GREEN}==========================================================================${NC}"


# ====== Repositories ===========
echo -e "${GREEN}========== Adding Repositories =========${NC}"

sudo rm $DST_SRC_PATH/sources.list
sudo cp $SRC_SRC_PATH/sources.list $DST_SRC_PATH/

sudo apt update && sudo apt full-upgrade -y

# ====== Firmware ===============
echo -e "${GREEN}===================== UPDATING FIRMWARE ==================================${NC}"

sudo apt install fwupd -y
sudo service fwupd start -y
sudo fwupdmgr refresh -y
sudo fwupdmgr update -y

sudo apt install firmware-linux -y
sudo apt install firmware-misc-nonfree -y

sudo apt install systemd-sysv -y

sudo apt install acpi -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

sudo apt install acpid -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

sudo apt install brightnessctl -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

sudo apt install pulseaudio-utils -y 

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

sudo apt install pavucontrol -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

# ====== Terminal ===============
echo -e "${GREEN}Instalando Terminator==================================${NC}"
sudo apt install terminator -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

# ===== REEBOOT ====================
echo -e "${RED}===================== REEBOOTING SYSTEM =================================${NC}"

echo -e "${GREEN}==========================================================================${NC}"
echo -e "${GREEN}============================ UPDATING SYSTEM =============================${NC}"
echo -e "${GREEN}==========================================================================${NC}"

sudo reboot 

