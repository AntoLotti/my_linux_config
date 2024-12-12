#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
NC='\033[0m' # Sin color

# ====== Repositorios ===========
sudo add-apt-repository universe


echo -e "${GREEN} Instalando Servicio X ================================${NC}"
sudo apt install xorg

echo -e "${GREEN} Instalando lightdm ================================${NC}"
sudo apt install lightdm



