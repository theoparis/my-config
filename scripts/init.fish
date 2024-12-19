#!/usr/bin/env fish
echo "Attempting to initialize config from $PWD"

mkdir -p ~/.local/bin ~/.local/share/nvim/lazy

gix clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim

# Symlinks
echo "Linking config files..."
stow -t ~/ dotfiles

echo "Done."
