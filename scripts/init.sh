#!/usr/bin/env fish
echo "Attempting to initialize config from $(pwd)"

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fish -c "cd ~/.tmux/plugins/tpm && git pull"

# Zsh plugins
mkdir -p ~/.config/zsh

# Xplr File Manager
mkdir -p ~/.config/xplr/plugins

git clone https://github.com/prncss-xyz/icons.xplr ~/.config/xplr/plugins/icons

# Symlinks
echo "Linking config files..."
stow -t ~/ dotfiles

echo "Done."
