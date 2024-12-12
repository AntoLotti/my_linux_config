#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

# ====== Start Of Script ======
echo -e "${GREEN}===================== INSTALLING GRAPHIC ================================${NC}"

echo -e "${GREEN}========== Installing XORG =============${NC}"
sudo apt install xorg

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi



# ====== End Of Script ======
echo -e "${GREEN}===================== END OF PACKAGES ====================================${NC}"