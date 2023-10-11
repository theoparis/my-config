#!/usr/bin/env fish
echo Attempting to initialize config from $PWD

mkdir -p ~/.local/bin

if not type -q git
	echo git is not installed
	exit 1
end

git clone https://code.flowtr.dev/nvim-plugins/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim

end

# Symlinks
echo "Linking config files..."
stow -t ~/ dotfiles

echo "Done."

