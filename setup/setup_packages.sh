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
    if

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
    local output_file=$2

    ((numb_Pack++))
    echo -e "${BLUE}========== Downloading from $url ===========${NC}"
    
    if curl -o "$output_file" -L "$url"; then
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
# ====== Start Of Script ======
echo -e "${GREEN}===================== INSTALLING PACKAGES ================================${NC}"

## PACKAGES MANAGERS #3
# ------------------- #

# snap
install_package_apt snapd 0
# synaptic
install_package_apt synaptic 0
# faltpak
install_package_apt flatpak 0
# wget
install_package_apt wget 0
# curl
install_package_apt curl 0

# BASIC PACKAGES ##
# --------------- #
install_package_apt build-essential 0
install_package_apt software-properties-common 0
install_package_apt ccache 0
install_package_apt libffi-dev 0
install_package_apt libssl-dev 0 
install_package_apt dfu-util 0
install_package_apt libusb-1.0-0 0
install_package_apt "unzip zip tar gzip" 0
install_package_apt usbutils 0
install_package_apt udisks2 0
install_package_apt dosfstools 0
install_package_apt ntfs-3g 0

install_package_apt nodejs 0
install_package_apt npm 0
install_package_apt ripgrep 0
install_package_apt gettext 0

install_package_apt libqt6svg6 1
install_package_apt libqt5svg5 1
install_package_apt qml-module-qtquick-layouts 1
install_package_apt qml-module-qtquick-controls2 1
install_package_apt qml-module-qtgraphicaleffects 1  
install_package_apt qml6-module-qtquick-controls 0


## PYTHON ##
# -------- #
install_package_apt python3-full 0
install_package_apt python3 0
install_package_apt python3-pip 0
install_package_apt python3-venv 0
install_package_apt python3-launchpadlib 0
install_package_apt python3-pulsectl 0


# ====== End Of Script ======
echo -e "${GREEN}===================== END OF PACKAGES ====================================${NC}"