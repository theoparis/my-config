if test -z $MY_CFG
    export MY_CFG="$HOME/my-config";
end

echo "Attempting to initialize config from $MY_CFG.";

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd $HOME/.tmux/plugins/tpm && git pull

mkdir -p $HOME/.config/nvim
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/bin

curl https://raw.githubusercontent.com/tj/n/master/bin/n > ~/bin/n
chmod +x ~/bin/n

curl https://raw.githubusercontent.com/jamesob/desk/master/desk > ~/bin/desk
chmod +x ~/bin/desk
mkdir -p ~/.config/fish/completions
curl https://raw.githubusercontent.com/jamesob/desk/master/shell_plugins/fish/desk.fish > ~/.config/fish/completions/desk.fish

git clone https://github.com/wbthomason/packer.nvim \
    $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
cd  $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim && git pull

# Symlinks
ln -s $MY_CFG/dotfiles/neovim/lua ~/.config/nvim/lua
ln -s $MY_CFG/dotfiles/neovim/init.lua ~/.config/nvim/init.lua
ln -s $MY_CFG/dotfiles/awesome/rc.lua ~/.config/awesome/rc.lua
ln -s $MY_CFG/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -s $MY_CFG/dotfiles/fish/fish_plugins ~/.config/fish/fish_plugins
ln -s $MY_CFG/dotfiles/tmux.conf ~/.tmux.conf
ln -s $MY_CFG/dotfiles/hyper.js ~/.hyper.js
ln -s $MY_CFG/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s $MY_CFG/dotfiles/starship.toml ~/.config/starship.toml
mkdir -p ~/.config/alacritty/
ln -s $MY_CFG/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

cd $MY_CFG
echo "Done."

