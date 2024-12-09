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

echo -e "${GREEN}========== Installing Synaptic =========${NC}"
sudo apt install synaptic -y

echo -e "${GREEN}========== Installing Flatpak ==========${NC}"
sudo apt-get install flatpak -y

echo -e "${GREEN}========== Installing Curl =============${NC}"
sudo apt-get install curl -y

# localizador de paquetes huerfanos
echo -e "${GREEN}========== Installing Deborphan ========${NC}"
sudo apt install deborphan -y

# ====== Python ====================
echo -e "${GREEN}========== Installing Python ===========${NC}"
sudo apt install python3 -y

echo -e "${GREEN}========== Installing pip ==============${NC}"
sudo apt install python3-pip -y

echo -e "${GREEN}========== Instalando Python3-venv =====${NC}"
sudo apt install python3-venv -y


