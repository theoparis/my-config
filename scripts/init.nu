echo "Attempting to initialize config from $PWD"

coreutils mkdir -p ~/.local/bin ~/.local/share/nvim/lazy

do -i { jj git clone --colocate https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim }

# Symlinks
echo "Linking config files..."
stow -t ~/ dotfiles

echo "Done."
