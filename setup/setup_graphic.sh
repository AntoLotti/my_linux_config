#!/bin/bash

# Terminal Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

# ====== Start Of Script ======
echo -e "${GREEN}===================== INSTALLING GRAPHIC ================================${NC}"

echo -e "${GREEN}========== Installing XORG =============${NC}"
sudo apt install xorg -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

echo -e "${GREEN}========== Installing SDDM =============${NC}"
sudo apt-get install --no-install-recomends install sddm -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

#echo -e "${GREEN}========== Installing SpectrWM =============${NC}"
#sudo apt-get install spectrwm -y

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

# ====== Enviroment Tools ===



# ====== End Of Script ======
echo -e "${GREEN}===================== END OF GRAPHIC ====================================${NC}"