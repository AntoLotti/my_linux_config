#!/bin/bash

# Terminal Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # Sin color

# ====== Global variables ======
numb_Pack=0
numb_Inst_Pack=0
numb_Fail_Pack=0

installed_packages=()
failed_packages=()

# ====== Functions ======
install_package_apt() {
    local package_name=$1
    local recom=$2  # 1 to noy install recommendations, 0 to do it 

    ((numb_Pack++))
    echo -e "${BLUE}========== Installing $package_name ===========${NC}"
    
    if [ $recom  -eq 1 ]; then 
        sudo apt-get install --no-install-recommends -y $package_name
    else
        sudo apt-get install -y $package_name
    fi

    if [ $? -ne 0 ]; then
        echo -e "${RED}Error installing $package_name.${NC}"
        failed_packages+=($package_name)
        ((numb_Fail_Pack++))
    else
        echo -e "${GREEN}Installation of $package_name correct.${NC}"
        installed_packages+=($package_name)
        ((numb_Inst_Pack++))
    fi
}

install_package_curl(){
    local url=$1
    local flag=$2

    ((numb_Pack++))
    echo -e "${BLUE}========== Downloading from $url ===========${NC}"
    
    if curl "$url" "$flag"; then
        echo -e "${GREEN}Downloaded successfully: $output_file.${NC}"
        installed_packages+=("$output_file")
        ((numb_Inst_Pack++))
    else
        echo -e "${RED}Error downloading from $url.${NC}"
        failed_packages+=("$url")
        ((numb_Fail_Pack++))
    fi
}

install_package_snap(){
    local package_name=$1

    ((numb_Pack++))
    echo -e "${BLUE}========== Installing $package_name with snap ===========${NC}"
    
    if sudo snap install "$package_name"; then
        echo -e "${GREEN}Snap package $package_name installed successfully.${NC}"
        installed_packages+=("$package_name")
        ((numb_Inst_Pack++))
    else
        echo -e "${RED}Error installing snap package $package_name.${NC}"
        failed_packages+=("$package_name")
        ((numb_Fail_Pack++))
    fi
}

resumen_fn() {

    if [ $numb_Inst_Pack == $numb_Pack ]; then
        echo -e "${GREEN}ALL PACKAGES INSTALLED"
        echo -e "${GREEN}======================"
        echo -e "${GREEN}PACKAGES INSTALLED:"
        for (( i = 0; i < "${#installed_packages[@]}"; i++ )); do
            echo -e "${GREEN}[$i] ${installed_packages[$i]}"
        done
    else
        echo -e "${RED}FAILED TO INSTALL ${numb_Fail_Pack}/${numb_Pack}"
        echo -e "${RED}======================="
        echo -e "${GREEN}PACKAGES INSTALLED:"
        
        for (( i = 0; i < "${#installed_packages[@]}"; i++ )); do
            echo -e "${GREEN}[$i] ${installed_packages[$i]}"
        done

        echo -e "${RED}PACKAGES MISSING:"
        for (( i = 0; i < "${#failed_packages[@]}"; i++ )); do
            echo -e "${RED}[$i] ${failed_packages[$i]}"
        done

    fi
}

# ====== PATHS ================
SRC_DIR_PATH=$(dirname "$(realpath "$0")")

# User home directori
USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)

# System etc path
DST_ETC_PATH=/etc

# Repo Config path
SRC_CONF_PATH=$(dirname "$SRC_DIR_PATH")/.config
# System ./config path
DST_CONF_PATH=$USER_HOME/.config

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
DST_WALLPAPER=$USER_HOME/Pictures/wallpaper

# Repo Bash files paths
SRC_BASHRC_PATH=$SRC_OTHERS_PATH/.bashrc
SRC_BASH_ALIASES_PATH=$SRC_OTHERS_PATH/.bash_aliases


# ====== START OF SCRIPT ======
echo -e "${GREEN}===================== START OF APPEARENCE ================================${NC}"

## .config ##
# --------- #
sudo rm -r $DST_CONF_PATH
sudo cp -r $SRC_CONF_PATH $USER_HOME

## TERMINAL PROMPT ##
# ----------------- #
install_package_curl -sS https://starship.rs/install.sh

## STATUS BAR ##
# ------------ #

sudo mkdir -p $DST_CONF_PATH/i3blocks/scripts

sudo git clone https://github.com/vivien/i3blocks-contrib.git $DST_CONF_PATH/i3blocks/scripts/

## FONTS ##
# ------- #
sudo apt install xfonts-base -y
sudo apt install fonts-font-awesome -y

sudo mkdir -p $USER_HOME/.local/share

sudo mkdir -p $USER_HOME/.local/share/fonts

sudo cp $SRC_FONTS/*.ttf  $USER_HOME/.local/share/fonts/

## ICONS ##
# ------- #
sudo cp $SRC_ICONS/* /usr/share/icons/

## WALLPAPERS ##
# ------------ #
sudo mkdir -p $DST_WALLPAPER
sudo cp $SRC_WALLPAPER/* $DST_WALLPAPER

## SDDM ##
# ------ #
sudo mkdir -p /usr/share/sddm/themes

sudo git clone -b master --depth 1 https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme

sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/

## MY SCRIPTS ##
# ------------ #

# I3blocks scripts
sudo cp -r $SRC_SOURCE/my_scripts/bluetooth $DST_CONF_PATH/i3blocks/scripts/
sudo cp -r $SRC_SOURCE/my_scripts/backlight $DST_CONF_PATH/i3blocks/scripts/

# Others Scripts
sudo cp $SRC_SOURCE/my_scripts/*.sh $DST_CONF_PATH/i3blocks/scripts/

# ====== END OF SCRIPT ========
echo -e "${GREEN}===================== END OF APPEARENCE ==================================${NC}"


