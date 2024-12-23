#!/bin/bash

# Terminal Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # Sin color

# ====== Functions ======
install_package() {
    local package_name=$1
    echo -e "${BLUE}========== Installing $package_name ===========${NC}"
    sudo apt-get install -y $package_name
    if [ $? -ne 0 ]; then
        echo -e "${RED}Error installing $package_name. Aborting.${NC}"
        exit 1
    fi
}

# ====== Start Of Script ======
echo -e "${GREEN}===================== INSTALLING APPS ====================================${NC}"

install_package brave-browser
install_package libreoffice
install_package spotify 

# ====== End Of Script ======
echo -e "${GREEN}===================== END OF APPS ========================================${NC}"
