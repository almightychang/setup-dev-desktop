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
cp .zshrc ~/.zshrc

echo "Installing Powerlevel10k & Terminal"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Now set plugins and themes in zshrc"
cp .p10k.zsh ~/.p10k.zsh

source ~/.zshrc
