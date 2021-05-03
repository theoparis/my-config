if [ -z ${MY_CFG} ]; then
    export MY_CFG="$HOME/my-config";
fi

echo "Attempting to initialize config from ${MY_CFG}.";

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "cd ~/.tmux/plugins/tpm && git pull"

mkdir -p ~/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

FORCE=true sh -c "$(curl -fsSL https://starship.rs/install.sh)"

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

# Zsh plugins

# Symlinks
ln -s $MY_CFG/dotfiles/neovim/lua ~/.config/nvim/lua
ln -s $MY_CFG/dotfiles/neovim/init.lua ~/.config/nvim/init.lua
ln -s $MY_CFG/dotfiles/awesome/rc.lua ~/.config/awesome/rc.lua
ln -s $MY_CFG/dotfiles/zsh/zshrc ~/.zshrc
ln -s $MY_CFG/dotfiles/tmux.conf ~/.tmux.conf
ln -s $MY_CFG/dotfiles/hyper.js ~/.hyper.js
ln -s $MY_CFG/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s $MY_CFG/dotfiles/starship.toml ~/.config/starship.toml
mkdir -p ~/.config/alacritty/
ln -s $MY_CFG/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s $MY_CFG/scripts/bin/myrmidon/myrmidon.sh ~/bin/myrmidon.sh
ln -s $MY_CFG/scripts/bin/myrmidon/confirm.sh ~/bin/confirm.sh
echo "Done."

