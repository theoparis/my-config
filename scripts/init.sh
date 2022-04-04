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

# Node Version Manager
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o ~/.local/bin/n
chmod +x ~/.local/bin/n

# Neovim plugin manager
git clone https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sh -c "cd  ~/.local/share/nvim/site/pack/packer/start/packer.nvim && git pull"

mkdir -p ~/.zfunc
curl \
    -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose \
    -o ~/.zfunc/_docker-compose

# Symlinks
echo "Linking config files..."
stow dotfiles

echo "Done."
