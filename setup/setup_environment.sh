#!/bin/bash

# Terminal Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

# ====== Start Of Script ======
echo -e "${GREEN}===================== INSTALLING GRAPHIC ================================${NC}"

# TERMINAL 
echo -e "${GREEN}========== Installing TERMINATOR =======${NC}"
sudo apt install terminator -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

# XORG
echo -e "${GREEN}========== Installing XORG =============${NC}"
sudo apt install xorg -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

# SDDM
echo -e "${GREEN}========== Installing SDDM =============${NC}"
sudo apt-get install --no-install-recomends sddm -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

# SPECTRWM
#echo -e "${GREEN}========== Installing SpectrWM =============${NC}"
#sudo apt-get install spectrwm -y

# I3-WM
sudo apt install i3-wm

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

# ROFI
sudo apt install rofi -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

# POLYBAR


# BUMBLEBEE-STATUS
sudo apt -y install bumblebee-status

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi


# TO SETUP BACKGROUND
sudo apt install feh -y
sudo apt install picom -y


# TERMINAL 
sudo apt install terminator -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi


# VIM
sudo apt-get install vim -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi


# DUNST
sudo apt install dunst -y

# ====== End Of Script ======
echo -e "${GREEN}===================== END OF GRAPHIC ====================================${NC}"