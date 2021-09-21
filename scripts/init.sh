echo "Attempting to initialize config from $(pwd)";

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "cd ~/.tmux/plugins/tpm && git pull"

# Zsh plugins
mkdir -p ~/.config/zsh

# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Neovim plugin manager
git clone https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sh -c "cd  ~/.local/share/nvim/site/pack/packer/start/packer.nvim && git pull"

mkdir -p ~/.zfunc
curl \
    -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose \
    -o ~/.zfunc/_docker-compose

# Symlinks
echo "Linking config files..."
stow dotfiles

echo "Done."

