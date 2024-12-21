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

sudo apt install xfonts-terminus

# FONTS

sudo mkdir $HOME/.local/share

sudo mkdir $HOME/.local/share/fonts

sudo cp $SRC_FONTS/*.ttf  ~/.local/share/fonts/


# ICONS


# I3


# SDDM
sudp apt install --no-install-recommends qml-module-qtquick-layouts qml-module-qtquick-controls2 libqt6svg6
sudo apt -y install qml6-module-qtquick-controls

sudo mkdir /usr/share/sddm/themes

cp -r $SRC_THEMES/sddm/* /usr/share/sddm/themes/

sudo cp $SRC_ETC_PATH/sddm.conf $DST_ETC_PATH/

# ROFI

# STARTSHIP

# Picom

# ====== END OF SCRIPT ========



