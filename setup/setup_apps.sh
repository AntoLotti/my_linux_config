#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# ====== Aplicaciones ======
echo -e "${GREEN}Instalando Brave Browser================================${NC}"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

echo -e "${GREEN}Instalando LibreOffice=================================${NC}"
sudo apt install libreoffice -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

echo -e "${GREEN}Instalando Spotify=====================================${NC}"
sudo snap install spotify -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi





