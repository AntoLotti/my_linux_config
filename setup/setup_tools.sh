#!/bin/bash

# Terminal Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
ORGANGE=''
NC='\033[0m' # Sin color

# ====== Basic Tools ===========

sudo apt-get install imagemagick -y

sudo apt-get install graphicsmagick -y

sudo apt-get install mailutils -y

sudo apt-get install bash-completion -y

sudo apt-get install man-db manpages -y

echo -e "${GREEN}===== Installing Development Tools =====${NC}"
sudo apt-get install git flex bison gperf ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0 -y

# ====== Dev Tools =============
echo -e "${GREEN}========== Installing Make =============${NC}"
sudo apt install make -y

echo -e "${GREEN}========== Installing  CMake ===========${NC}"
sudo apt install cmake -y

echo -e "${GREEN}========== Installing  Gcc =============${NC}"
sudo apt-get install gcc -y

echo -e "${GREEN}========== Installing  GDB =============${NC}"
sudo apt install gdb gdb-arm-none-eabi -y

echo -e "${GREEN}========== Installing  Opencd ==========${NC}"
sudo apt install openocd -y

echo -e "${GREEN}========== Installing  Putty ===========${NC}"
sudo apt install putty -y

echo -e "${GREEN}========== Installing  Doxygen =========${NC}"
sudo apt install doxygen -y

echo -e "${GREEN}========== Installing  Valgrind ========${NC}"
sudo apt install valgrind -y


# ====== Terminal Tools =============


# ====== Fin del Script ======
echo -e "${GREEN}¡Instalación completa!=================================${NC}"
