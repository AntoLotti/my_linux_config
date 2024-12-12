#!/bin/bash

# Configuración de colores para el terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}Inicio de instalación de ESP-IDF...${NC}"

# Paso 1: Instalar dependencias
echo -e "${GREEN}Instalando dependencias necesarias...${NC}"
sudo apt update
sudo apt install -y git wget flex bison gperf python3 python3-pip python3-setuptools \
                     cmake ninja-build ccache libffi-dev libssl-dev dfu-util \
                     libusb-1.0-0 unzip

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al instalar dependencias. Aborta.${NC}"
    exit 1
fi

# Paso 2: Clonar el repositorio ESP-IDF
echo -e "${GREEN}Clonando ESP-IDF...${NC}"
mkdir -p ~/esp
ESP_DIR="$HOME/esp"
git clone -b v5.2.3 --recursive https://github.com/espressif/esp-idf.git $ESP_DIR

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al clonar ESP-IDF. Aborta.${NC}"
    exit 1
fi

# Paso 3: Configurar herramientas del entorno
echo -e "${GREEN}Configurando herramientas de ESP-IDF...${NC}"
cd $ESP_DIR
./install.sh all

if [ $? -ne 0 ]; then
    echo -e "${RED}Error durante la instalación de herramientas. Aborta.${NC}"
    exit 1
fi

# Paso 4: Configurar entorno de ESP-IDF
echo -e "${GREEN}Configurando el entorno de ESP-IDF...${NC}"
echo "source $ESP_DIR/export.sh" >> $HOME/.bashrc
#source $HOME/.bashrc
. $HOME/esp/export.sh

if [ $? -ne 0 ]; then
    echo -e "${RED}Error al configurar el entorno. Verifica manualmente.${NC}"
    exit 1
fi

# Paso 5: Hacer que siempre este activo

#echo -e "${GREEN}ESP-IDF instalado correctamente. Por favor, reinicia tu terminal.${NC}"
