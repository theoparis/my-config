#!/usr/bin/env zsh
echo "Attempting to initialize config from $(pwd)"

mkdir ~/.config/xplr/plugins

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/prncss-xyz/icons.xplr ~/.config/xplr/plugins/icons
git clone https://github.com/dtomvan/xpm.xplr ~/.local/share/xplr/dtomvan/xpm.xplr

zsh -c "cd ~/.tmux/plugins/tpm && git pull"

# Symlinks
echo "Linking config files..."
fling --ignore 'README.*' --src-dir ./dotfiles link

echo "Done."

