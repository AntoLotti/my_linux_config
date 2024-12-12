#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

# ====== Start Of Script ======
echo -e "${GREEN}===================== INSTALLING PACKAGES ================================${NC}"

# ====== Basics Packages ======
echo -e "${GREEN}========== Installing Snap =============${NC}"
sudo apt-get install snap -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

echo -e "${GREEN}========== Installing Synaptic =========${NC}"
sudo apt install synaptic -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

echo -e "${GREEN}========== Installing Flatpak ==========${NC}"
sudo apt-get install flatpak -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

echo -e "${GREEN}========== Installing Curl and wget ======${NC}"
sudo apt install wget curl -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

# localizador de paquetes huerfanos
echo -e "${GREEN}========== Installing Deborphan ========${NC}"
sudo apt install deborphan -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi


# ====== Python ====================
echo -e "${GREEN}========== Installing Python ===========${NC}"
sudo apt install python3 -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

echo -e "${GREEN}========== Installing pip ==============${NC}"
sudo apt install python3-pip -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

echo -e "${GREEN}========== Installing Python3-venv =====${NC}"
sudo apt install python3-venv -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

# ====== End Of Script ======
echo -e "${GREEN}===================== END OF PACKAGES ====================================${NC}"