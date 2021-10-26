#!/bin/bash

sudo apt update
sudo apt upgrade -y

echo "Installing packages"
sudo apt-get install git neovim curl terminator -y

echo "Installing gcc arm toolchain"
curl -fsSL https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
sudo tar xjf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 -C /usr/share
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc 
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux/bin/arm-none-eabi-g++ /usr/bin/arm-none-eabi-g++ 
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux/bin/arm-none-eabi-gdb /usr/bin/arm-none-eabi-gdb 
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux/bin/arm-none-eabi-size /usr/bin/arm-none-eabi-size 
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux/bin/arm-none-eabi-objcopy /usr/bin/arm-none-eabi-objcopy
sudo apt install libncurses-dev -y
sudo ln -s /usr/lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/x86_64-linux-gnu/libncurses.so.5
sudo ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6 /usr/lib/x86_64-linux-gnu/libtinfo.so.5

echo "vim-plug for neovim"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp -r nvim/ ~/.config/nvim

echo "Installing pyenv..."
git clone https://github.com/pyenv/pyenv.git

echo "Installing oh-my-zsh"
echo "Add plugin into zshrc plugin"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing Powerlevel10k & Terminal"
cp -r .fonts/ ~/.fonts/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

pip install requests
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"

cp .p10k.zsh ~/.p10k.zsh
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc

echo 'alias activate="source .venv/bin/activate"' >> ~/.zshrc
echo 'alias pyclean='find . -name "*.py[co]" -o -name __pycache__ -exec rm -rf {} +'' >> ~/.zshrc

source ~/.zshrc
exit
