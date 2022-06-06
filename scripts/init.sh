#!/bin/zsh
# shellcheck shell=bash

echo "Attempting to initialize config from $(pwd)"

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "cd ~/.tmux/plugins/tpm && git pull"

# Zsh plugins
mkdir -p ~/.config/zsh

# Xplr File Manager
mkdir -p ~/.config/xplr/plugins

git clone https://github.com/prncss-xyz/icons.xplr ~/.config/xplr/plugins/icons

# Neovim plugin manager
git clone https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sh -c "cd  ~/.local/share/nvim/site/pack/packer/start/packer.nvim && git pull"

# Symlinks
echo "Linking config files..."
stow dotfiles

echo "Done."
