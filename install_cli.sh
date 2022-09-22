#!/bin/bash
sudo apt-get install zsh xclip -y

chsh -s /bin/zsh

echo "Install neovim"
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen -y
git clone https://github.com/neovim/neovim
cd neovim && make
sudo make install
cd ..
rm -rf neovim/

echo "vim-plug for neovim"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp -r .config/nvim/ ~/.config/nvim

echo "terminator theme"
pip install requests
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Install ccls"
sudo apt-get install clang libclang-dev
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=/usr/lib/llvm-14 \
    -DLLVM_INCLUDE_DIR=/usr/lib/llvm-14/include \
    -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-14/
cmake --build Release --target install
cd ..
