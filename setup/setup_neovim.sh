#!/bin/bash

# Terminal Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'


sudo apt-get install ninja-build gettext cmake unzip curl build-essential

git clone https://github.com/neovim/neovim

cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

git checkout stable

sudo make install

echo -e "${GREEN}========== Installing  Neovim ==========${NC}"
sudo apt install neovim -y