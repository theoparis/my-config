#!/usr/bin/env zsh
echo "Attempting to initialize config from $(pwd)"

mkdir -p ~/.config/xplr/plugins
mkdir -p ~/.config/zsh

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/prncss-xyz/icons.xplr ~/.config/xplr/plugins/icons
git clone https://github.com/dtomvan/xpm.xplr ~/.local/share/xplr/dtomvan/xpm.xplr
git clone https://github.com/streetturtle/awesome-wm-widgets ~/.config/awesome/awesome-wm-widgets

zsh -c "cd ~/.tmux/plugins/tpm && git pull"

# Symlinks
echo "Linking config files..."
fling --src-dir ./dotfiles link

echo "Done."

