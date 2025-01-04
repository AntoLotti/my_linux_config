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

# ====== Start Of Script ======
echo -e "${GREEN}===================== INSTALLING TOOLS ===================================${NC}"

## GENERAL TOOLS ##
# ---------------- #
install_package_apt imagemagick 0
install_package_apt graphicsmagick 0
install_package_apt mailutils 0

## DEVELOPMENT TOOLS ##
# ------------------- #
install_package_apt git 0 
install_package_apt flex 0
install_package_apt bison 0 
install_package_apt gperf 0
install_package_apt ninja-build 0

## INDIVIDUAL DEVELOPMENT TOOLS ##
# ------------------------------ #
install_package_apt make 0
install_package_apt cmake 0
install_package_apt gcc 0
install_package_apt gdb 0
install_package_apt gdb-arm-none-eabi 0
install_package_apt openocd 0
install_package_apt putty 0
install_package_apt doxygen 0
install_package_apt valgrind 0
install_package_curl https://sh.rustup.rs -sSf

## DEVELOPMENT IDE ##
# ----------------- #
install_package_apt vim 0

# ====== End Of Script ======

resumen_fn

echo -e "${GREEN}===================== END OF TOOLS =======================================${NC}"

