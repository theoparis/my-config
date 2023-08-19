#!/usr/bin/env fish
echo Attempting to initialize config from $PWD

mkdir -p ~/.local/bin

if not type -q git
	echo git is not installed
	exit 1
end

git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim

if type -q go
	echo Setting up oh-my-posh...
	git clone --depth 1 https://github.com/JanDeDobbeleer/oh-my-posh ~/.local/share/oh-my-posh
	pushd ~/.local/share/oh-my-posh/src
	CGO_ENABLED=0 go build -ldflags="-s -w" -o ~/.local/bin/oh-my-posh .
	popd
else

end

# Symlinks
echo "Linking config files..."
stow -t ~/ dotfiles

echo "Done."

