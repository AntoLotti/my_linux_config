#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# ====== PATHS ================
SRC_DIR_PATH=$(dirname "$0")

# Fonts

# Repo Config path
SRC_ETC_PATH=$SRC_DIR/etc
# System ./config path
DST_ETC_PATH=/etc

# Repo Config path
SRC_CONF_PATH=$SRC_DIR/.config
# System ./config path
DST_CONF_PATH=$HOME/.config

# Repo others path
SRC_OTHERS_PATH=$SRC_DIR/others

# Repo source folder
SRC_SOURCE=$SRC_DIR_PATH/source
# Repo fonts
SRC_FONTS=$SRC_SOURCE/my_fonts
# Repo icons
SRC_ICONS=$SRC_SOURCE/my_icons
# Repo themes
SRC_THEMES=$SRC_SOURCE/my_themes



# Repo Bash files paths
SRC_BASHRC_PATH=$SRC_OTHERS_PATH/.bashrc
SRC_BASH_ALIASES_PATH=$SRC_OTHERS_PATH/.bash_aliases


# ====== START OF SCRIPT ======

# FONTS
sudo apt install xfonts-base

sudo mkdir $HOME/.local/share

sudo mkdir $HOME/.local/share/fonts

sudo cp $SRC_FONTS/*.ttf  ~/.local/share/fonts/


# ICONS


# SDDM
sudp apt install --no-install-recommends qml-module-qtquick-layouts qml-module-qtquick-controls2 libqt6svg6
sudo apt -y install qml6-module-qtquick-controls

sudo mkdir /usr/share/sddm/themes

cp -r $SRC_THEMES/sddm/* /usr/share/sddm/themes/

sudo cp $SRC_ETC_PATH/sddm.conf $DST_ETC_PATH/

# I3-WM


# ROFI

#POLYBAR



# TERMINAL PROMPT
echo -e "${GREEN}Instalando StartShip===================================${NC}"
sudo curl -sS https://starship.rs/install.sh | sh

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

# Picom

# ====== END OF SCRIPT ========



