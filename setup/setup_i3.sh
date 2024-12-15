#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

# ====== PATHS ================

curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
sudo apt install apt-transport-https --yes
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
sudo apt update
sudo apt install i3

# ===== REEBOOT ====================
echo -e "${GREEN} Reiniciando sistema ==================================${NC}"
#sudo reboot 


