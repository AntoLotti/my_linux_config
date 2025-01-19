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

# ====== PATHS ==========

# Repo Dir
SRC_DIR_PATH=$(dirname "$(realpath "$0")")

# Repo source path
SRC_SRC_PATH=$SRC_DIR_PATH/others/sources

# System sources.list
DST_SRC_PATH=/etc/apt

# ====== Start Of Script ======
echo -e "${GREEN}==========================================================================${NC}"
echo -e "${GREEN}=========================== UPDATING SYSTEM ==============================${NC}"
echo -e "${GREEN}==========================================================================${NC}"


# ====== Repositories ===========
sudo rm $DST_SRC_PATH/sources.list

sudo cp $SRC_SRC_PATH/sources.list $DST_SRC_PATH/

sudo apt update && sudo apt full-upgrade -y

# ====== Firmware ===============

install_package_apt firmware-linux 
install_package_apt firmware-misc-nonfree
install_package_apt systemd-sysv
install_package_apt acpi
install_package_apt acpid

vendor=$(sudo lshw -C display | awk '/vendor:/ {print $2}')
if [[ "$vendor" == "NVIDIA" ]]; then
    install_package_apt nvidia-driver
fi

install_package_apt brightnessctl
install_package_apt pulseaudio-utils
install_package_apt pavucontrol
install_package_apt blueman


# ===== END SCRIPT ==============

resumen_fn

# ===== ASK FOR REBOOT ==========

read -p "Do you want to reboot now? (y/n): " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo -e "${RED}===================== REEBOOTING SYSTEM =================================${NC}"
    sudo reboot

else

    echo -e "${GREEN}==========================================================================${NC}"
    echo -e "${GREEN}========================= END UPDATING SYSTEM ============================${NC}"
    echo -e "${GREEN}==========================================================================${NC}"

fi
