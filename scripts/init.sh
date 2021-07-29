echo "Attempting to initialize config from $(pwd)";

mkdir -p ~/.local/bin

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "cd ~/.tmux/plugins/tpm && git pull"

# Zsh plugins
mkdir -p ~/.config/zsh
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Starship Prompt
FORCE=true sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --bin-dir ~/.local/bin

# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

curl https://raw.githubusercontent.com/jamesob/desk/master/desk > ~/.local/desk
chmod +x ~/.local/bin/desk
mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/desk
curl https://raw.githubusercontent.com/jamesob/desk/master/shell_plugins/zsh/desk.plugin.zsh -o ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/desk/desk.plugin.zsh
# Neovim plugin manager
git clone https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sh -c "cd  ~/.local/share/nvim/site/pack/packer/start/packer.nvim && git pull"

# Symlinks
echo "Linking config files..."
stow dotfiles

echo "Done."

