#!/bin/bash

# Terminal Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# ====== PATHS ================
# ====== DEPENDENCIES =========
sudo apt-get install ninja-build gettext cmake unzip curl build-essential

# Cargo 
sudo curl https://sh.rustup.rs -sSf | sh

# ====== START OF SCRIPT ======

# Neovim
echo -e "${GREEN}========== Installing  Neovim ==========${NC}"
sudo apt install neovim -y

#Lazyvim
echo -e "${GREEN}========== Installing  LunarVim ==========${NC}"

sudo apt install git

sudo apt install nodejs npm

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

sudo apt install ripgrep

LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)

lvim +LvimUpdate +q

# ====== END OF SCRIPT ========