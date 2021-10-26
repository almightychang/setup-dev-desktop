#!/bin/bash

# Run after install.sh is done. Open new terminal and run the script.
# Change ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
# Change the terminal font to Meslo NF
# Enable option at Terminator(Right Click)-Preference-Plugins-TerminatorThemes
# Close and Open terminal to set powerlevel10k theme
# open nvim and type :PlugInstall to set nvim

echo "Add plugin into zshrc plugin"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing Powerlevel10k & Terminal"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

cp .p10k.zsh ~/.p10k.zsh
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc

echo 'alias activate="source .venv/bin/activate"' >> ~/.zshrc
echo "alias pyclean='find . -name \"*.py[co]\" -o -name __pycache__ -exec rm -rf {} +'" >> ~/.zshrc

source ~/.zshrc
