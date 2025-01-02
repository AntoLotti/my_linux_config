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

# ====== PATHS ================
SRC_DIR_PATH=$(dirname "$(realpath "$0")")

# System etc path
DST_ETC_PATH=/etc

# Repo Config path
SRC_CONF_PATH=$(dirname "$SRC_DIR_PATH")/.config
# System ./config path
DST_CONF_PATH=$HOME/.config

# Repo SDDM Files Path
SRC_SDDM=$(dirname "$SRC_DIR_PATH")/sddm

# Repo others path
SRC_OTHERS_PATH=$(dirname "$SRC_DIR_PATH")/others

# Repo appearance folder
SRC_SOURCE=$(dirname "$SRC_DIR_PATH")/appearance
# Repo fonts
SRC_FONTS=$SRC_SOURCE/my_fonts
# Repo icons
SRC_ICONS=$SRC_SOURCE/my_icons
# Repo themes
SRC_THEMES=$SRC_SOURCE/my_themes
# Repo Wallpaper
SRC_WALLPAPER=$SRC_SOURCE/my_wallpapers

# System Wallpaper
DST_WALLPAPER=$HOME/Pictures/wallpaper

# Repo Bash files paths
SRC_BASHRC_PATH=$SRC_OTHERS_PATH/.bashrc
SRC_BASH_ALIASES_PATH=$SRC_OTHERS_PATH/.bash_aliases


# ====== START OF SCRIPT ======
echo -e "${GREEN}===================== START OF APPEARENCE ================================${NC}"

# FONTS
sudo apt install xfonts-base

sudo mkdir -p $HOME/.local/share

sudo mkdir -p $HOME/.local/share/fonts

sudo cp $SRC_FONTS/*.ttf  ~/.local/share/fonts/

# ICONS
sudo cp $SRC_FONTS/* /usr/share/icons/

# WALLPAPERS
sudo mkdir -p $DST_WALLPAPER
sudo cp $SRC_WALLPAPER/* $DST_WALLPAPER

# SDDM
sudo mkdir -p /usr/share/sddm/themes

sudo cp -r $SRC_THEMES/sddm/* /usr/share/sddm/themes/

sudo cp $SRC_ETC_PATH/sddm.conf $DST_ETC_PATH/

## .config
sudo rm -r $DST_CONF_PATH
sudo cp -r $SRC_CONF_PATH

# PICOM
sudo cp -r $SRC_CONF_PATH/picom $DST_CONF_PATH/

# TERMINAL PROMPT
sudo curl -sS https://starship.rs/install.sh | sh


# ====== END OF SCRIPT ========
echo -e "${GREEN}===================== END OF APPEARENCE ==================================${NC}"


