#!/bin/bash

# Colores para el terminal
GREEN='\033[0;32m'
NC='\033[0m' # Sin color


# ====== Herramientas Básicas ======
echo -e "${GREEN}Instalando wget========================================${NC}"
sudo apt-get install wget -y

sudo apt install imagemagick

sudo apt install graphicsmagick

sudo apt install mailutils

echo -e "${GREEN}Instalando unzip=======================================${NC}"
sudo apt-get install unzip

echo -e "${GREEN}Instalando herramientas de desarrollo===================${NC}"
sudo apt-get install git flex bison gperf ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0 -y


# ====== Herramientas de Desarrollo ======
echo -e "${GREEN}Instalando make========================================${NC}"
sudo apt install make -y

echo -e "${GREEN}Instalando cmake=======================================${NC}"
sudo apt install cmake -y

echo -e "${GREEN}Instalando gcc=========================================${NC}"
sudo apt-get install gcc -y

echo -e "${GREEN}Instalando GDB=========================================${NC}"
sudo apt install gdb gdb-arm-none-eabi -y

echo -e "${GREEN}Instalando OpenOCD=====================================${NC}"
sudo apt install openocd -y

echo -e "${GREEN}Instalando Putty=======================================${NC}"
sudo apt install putty -y

echo -e "${GREEN}Instalando Doxygen=====================================${NC}"
sudo apt install doxygen -y

echo -e "${GREEN}Instalando Valgrind====================================${NC}"
sudo apt install valgrind -y


# ====== Fin del Script ======
echo -e "${GREEN}¡Instalación completa!=================================${NC}"