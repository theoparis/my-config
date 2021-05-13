if [ -z ${MY_CFG} ]; then
    export MY_CFG="$HOME/my-config";
fi

echo "Attempting to initialize config from ${MY_CFG}.";

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "cd ~/.tmux/plugins/tpm && git pull"

FORCE=true sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --bin-dir ~/bin

mkdir -p ~/bin
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
cd  ~/.local/share/nvim/site/pack/packer/start/packer.nvim && git pull

curl -L https://github.com/jszczerbinsky/ptSh/releases/download/latest/install.sh | sh

# Symlinks
ln -s $MY_CFG/dotfiles/neovim ~/.config/nvim
ln -s $MY_CFG/dotfiles/awesome/rc.lua ~/.config/awesome/rc.lua
ln -s $MY_CFG/dotfiles/zsh/zshrc ~/.zshrc
ln -s $MY_CFG/dotfiles/tmux.conf ~/.tmux.conf
ln -s $MY_CFG/dotfiles/hyper.js ~/.hyper.js
ln -s $MY_CFG/dotfiles/starship.toml ~/.config/starship.toml
mkdir -p ~/.config/alacritty/
ln -s $MY_CFG/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s $MY_CFG/scripts/bin/myrmidon/myrmidon.sh ~/bin/myrmidon.sh
ln -s $MY_CFG/scripts/bin/myrmidon/confirm.sh ~/bin/confirm.sh
echo "Done."

