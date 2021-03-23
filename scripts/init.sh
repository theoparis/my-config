if [ -z ${MY_CFG} ]; then
    export MY_CFG="$HOME/my-config";
fi

echo "Attempting to initialize config from ${MY_CFG}.";

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "cd ~/.tmux/plugins/tpm && git pull"

mkdir -p ~/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Symlinks
ln -s $MY_CFG/dotfiles/vimrc ~/.config/nvim/init.vim
ln -s $MY_CFG/dotfiles/zsh/zshrc ~/.zshrc
ln -s $MY_CFG/dotfiles/tmux.conf ~/.tmux.conf
ln -s $MY_CFG/dotfiles/hyper.js ~/.hyper.js
ln -s $MY_CFG/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s $MY_CFG/dotfiles/starship.toml ~/.config/starship.toml
mkdir -p ~/.config/alacritty/
ln -s $MY_CFG/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

echo "Done."

