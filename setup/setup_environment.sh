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

# System ./config path
DST_CONF_PATH=$USER_HOME/.config

# Repo appearance folder
SRC_SOURCE=$(dirname "$SRC_DIR_PATH")/appearance

# ====== Repositories =========

## Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

## Update
sudo apt update

# ====== Start Of Script ======
echo -e "${GREEN}===================== INSTALLING ENVIRONMENT =============================${NC}"

## WINDOWS SYSTEM ##
# ---------------- #

# DISPLAY SERVER
install_package_apt xorg 0

# WINDOS MANAGER
install_package_apt i3-wm 0
# Uncomment the following line if SpectrWM is needed
# install_package spectrwm

# DISPLAY MANAGER
sudo apt-get install --no-install-recommends sddm -y
if [ $? -ne 0 ]; then
    echo -e "${RED}Error installing SDDM. Aborting.${NC}"
    exit 1
fi


## DESKTOP ENVIROMENT ##
# -------------------- #

# STATUS BAR
install_package_apt i3blocks 0

# Uncomment the following line if bumbelbee is needed
# install_package bumblebee-status
# Uncomment the following line if Polybar is needed
# install_package polybar

# ROFI
install_package_apt rofi 0

# BACKGROUND
install_package_apt feh 0
install_package_apt picom 0

# NOTIFICATION GESTOR
install_package_apt dunst 0

# BROWSER
install_package_apt brave-browser 0


## TERMINAL ENVIRONMENT ##
# ----------------------- #

# TERMINAL
install_package_apt terminator 0

# TERMINALS TOOLS
install_package_apt bash-completion 0
install_package_apt man-db 0
install_package_apt manpages 0
install_package_apt fzf 0

# FILE MANAGER
install_package_apt ranger 0

# ====== End Of Script ======

resumen_fn

echo -e "${GREEN}===================== END OF ENVIRONMENT =================================${NC}"