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
echo -e "${GREEN}===================== INSTALLING THE DESKTOP ENVIROMENT ==================${NC}"

echo -e "${GREEN} Instalando Servicio X ================================${NC}"
sudo apt install xorg

echo -e "${GREEN} Instalando lightdm ================================${NC}"
sudo apt install lightdm

echo -e "${GREEN}========== Installing I3 ===============${NC}"

echo -e "${RED} > !!!! Adding Unstable repositories ONLY to install I3 ${NC}"

sudo rm $DST_SRC_PATH/sources.list
sudo cp $SRC_SRC_PATH/test_sources.list $DST_SRC_PATH/
sudo mv $DST_SRC_PATH/test_sources.list $DST_SRC_PATH/sources.list

sudo apt update -y

sudo apt install -t testing libc6
sudo apt install -t testing libev4t64
sudo apt install -t testing libglib2.0-0t64
sudo apt install -t testing libxcb-icccm4
sudo apt install -t testing libanyevent-i3-perl
sudo apt install -t testing libjson-xs-perl

sudo rm $DST_SRC_PATH/sources.list
sudo cp $SRC_SRC_PATH/sources.list $DST_SRC_PATH/

sudo apt update -y

curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
sudo apt install apt-transport-https --yes
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
sudo apt update
sudo apt install i3

# ===== REEBOOT ====================
echo -e "${GREEN} Reiniciando sistema ==================================${NC}"
#sudo reboot 


