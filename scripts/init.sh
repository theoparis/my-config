#!/usr/bin/env zsh
echo Attempting to initialize config from $PWD

mkdir -p ~/.local/bin

git clone https://code.flowtr.dev/nvim-plugins/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim

# Symlinks
echo "Linking config files..."
stow -t ~/ dotfiles

echo "Done."

