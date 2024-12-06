#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# ====== PATHS ================================== #

# Repo path
SRC_DIR=$(dirname "$0")

# Repo Config path
SRC_CONF_PATH=$SRC_DIR/.config

# System ./config path
DST_CONF_PATH=$HOME/.config

# Repo Bash files paths
SRC_BASHRC_PATH=$SRC_DIR/.bashrc
SRC_BASH_ALIASES_PATH=$SRC_DIR/.bash_aliases

# System bash files 
DST_BASHRC_PATH=$HOME
DST_BASH_ALIASES_PATH=$HOME

# Repo StarShip files path
SRC_STARSHIP_CONF_PATH=$SRC_CONF_PATH/starship

# System StarShip files path
DST_STARSHIP_CONF_PATH=$DST_CONF_PATH

# ====== BASH CONFIG ============================ #
echo -e "${GREEN}Setup BASH Configuration ======================================${NC}"
sudo cp "$SRC_BASH_ALIASES_PATH" "$DST_BASH_ALIASES_PATH"
sudo cp "$SRC_BASHRC_PATH" "$DST_BASHRC_PATH"

echo -e "${GREEN}Setup STARSHIP Configuration ==================================${NC}"
sudo cp -r "$SRC_STARSHIP_CONF_PATH" "$DST_STARSHIP_CONF_PATH"