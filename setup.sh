#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# ====== PATHS ================

# Repo Dir
SRC_DIR_PATH=$(dirname "$(realpath "$0")")

# Setup files path
SRC_FILES_PATH=$SRC_DIR_PATH/setup

# ====== Start Of Script ======
echo -e "${GREEN}==========================================================================${NC}"
echo -e "${GREEN}=================== SYSTEM SETUP =========================================${NC}"
echo -e "${GREEN}==========================================================================${NC}"

# ====== Linux Format ==============================
sudo dos2unix $SRC_DIR_PATH/setup_drivers.sh        # Drivers
sudo dos2unix $SRC_FILES_PATH/setup_packages.sh     # Packages
sudo dos2unix $SRC_FILES_PATH/setup_tools.sh        # Tools
sudo dos2unix $SRC_FILES_PATH/setup_environment.sh  # Environment
sudo dos2unix $SRC_FILES_PATH/setup_appearance.sh   # Appearence

# ====== Set execute permission on the scripts =====
sudo chmod +x $SRC_DIR_PATH/setup_drivers.sh        # Drivers
sudo chmod +x $SRC_FILES_PATH/setup_packages.sh     # Packages
sudo chmod +x $SRC_FILES_PATH/setup_tools.sh        # Tools
sudo chmod +x $SRC_FILES_PATH/setup_apps.sh         # Apps
sudo chmod +x $SRC_FILES_PATH/setup_environment.sh  # Environment
sudo chmod +x $SRC_FILES_PATH/setup_appearance.sh   # Appearence

# ===== ASK FOR REBOOT ==========

read -p "Do you want to reboot now? (y/n): " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo -e "${RED}===================== REEBOOTING SYSTEM =================================${NC}"
    sudo reboot

else

    echo -e "${GREEN}==========================================================================${NC}"
    echo -e "${GREEN}========================= END SYSTEM SETUP ===============================${NC}"
    echo -e "${GREEN}==========================================================================${NC}"

fi