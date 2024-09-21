#!/usr/bin/env nu
echo "Attempting to initialize config from $PWD"

mkdir ~/.local/bin

do -i { gix clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim }

# Symlinks
echo "Linking config files..."
stow -t ~/ dotfiles

echo "Done."

