#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# ====== PATHS ================

# Repo Dir
SRC_DIR_PATH=$(dirname "$0")

# Setup files path
SRC_FILES_PATH=$SRC_DIR_PATH/setup

# ====== Start Of Script ======
echo -e "${GREEN}==========================================================================${NC}"
echo -e "${GREEN}=================== SYSTEM CONFIGURATION =================================${NC}"
echo -e "${GREEN}==========================================================================${NC}"

# ====== Set execute permission on the scripts ===== 
chmod +x $SRC_FILES_PATH/setup_packages.sh       # Packages
chmod +x $SRC_FILES_PATH/setup_graphic.sh        # Graphic Env
chmod +x $SRC_FILES_PATH/setup_apps.sh           # Apps
chmod +x $SRC_FILES_PATH/setup_tools.sh          # Tools
chmod +x $SRC_FILES_PATH/setup_config.sh         # Configuration
chmod +x $SRC_FILES_PATH/setup_appearance.sh     # Appearence

# ====== Setup =====================================
sudo sh $SRC_FILES_PATH/setup_packages.sh       # Packages
sudo sh $SRC_FILES_PATH/setup_graphic.sh        # Graphic Env
sudo sh $SRC_FILES_PATH/setup_apps.sh           # Apps
sudo sh $SRC_FILES_PATH/setup_tools.sh          # Tools
sudo sh $SRC_FILES_PATH/setup_config.sh         # Configuration
sudo sh $SRC_FILES_PATH/setup_appearance.sh     # Appearence

# ===== REEBOOT ====================
echo -e "${RED}===================== REEBOOTING SYSTEM =================================${NC}"

echo -e "${GREEN}==========================================================================${NC}"
echo -e "${GREEN}=================== END SYSTEM CONFIGURATION =============================${NC}"
echo -e "${GREEN}==========================================================================${NC}"

sudo reboot 