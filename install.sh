#!/bin/bash

sudo apt update
sudo apt upgrade -y

echo "Installing fonts"
cp -r .fonts/ ~/.fonts/

echo "Installing packages"
sudo apt-get install git curl terminator net-tools python3-pip npm bear stlink-tools -y 

echo "Install STM32 related"
source ./install_stm32_dep.sh

echo "Install CLI related"
source ./install_cli.sh

echo "Install version manager"
source ./install_vm.sh

echo "Install utility"
source ./install_util.sh

source ./install_zsh_plugins.sh

exit
