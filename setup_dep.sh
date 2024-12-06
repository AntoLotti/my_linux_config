#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
NC='\033[0m' # Sin color

# ====== Repositorios ===========
sudo add-apt-repository universe

# ====== Inicio del Script ======
echo -e "${GREEN}Actualizando sistema====================================${NC}"
sudo apt update && sudo apt upgrade -y

# ====== Paquetes Básicos ======
echo -e "${GREEN}Instalando Snap ========================================${NC}"
sudo apt-get install snapd -y

echo -e "${GREEN}Instalando Synaptic ====================================${NC}"
sudo apt install synaptic -y

echo -e "${GREEN}Instalando Flatpak ====================================${NC}"
sudo apt-get install flatpak -y

echo -e "${GREEN}Instalando Curl =======================================${NC}"
sudo apt-get install curl -y

# localizador de paquetes huerfanos
echo -e "${GREEN}Instalando Deborphan ==================================${NC}"
sudo apt install deborphan

# ====== Python ====================
echo -e "${GREEN}Instalando Python =====================================${NC}"
sudo apt install python3 -y

echo -e "${GREEN}Instalando pip ========================================${NC}"
sudo apt install python3-pip -y

echo -e "${GREEN}Instalando Python3-venv ===============================${NC}"
sudo apt install python3-venv -y

# ====== Firmware ==================

echo -e "${GREEN}=========== UPDATING FIRMWARE =========================${NC}"

echo -e "${GREEN}Instalando fwupd ======================================${NC}"
sudo apt install fwupd

sudo service fwupd start

sudo fwupdmgr refresh

sudo fwupdmgr update



