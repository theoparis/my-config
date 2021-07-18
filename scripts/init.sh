echo "Attempting to initialize config from $(pwd)";

mkdir -p ~/bin

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "cd ~/.tmux/plugins/tpm && git pull"

FORCE=true sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --bin-dir ~/bin

mkdir -p ~/.config/zsh

curl https://raw.githubusercontent.com/tj/n/master/bin/n > ~/bin/n
chmod +x ~/bin/n

curl https://raw.githubusercontent.com/jamesob/desk/master/desk > ~/bin/desk
chmod +x ~/bin/desk
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

