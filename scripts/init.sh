if [ -z ${MY_CFG} ]; then
    export MY_CFG="~/my-config";
fi
  
echo "Attempting to initialize config from ${MY_CFG}.";

mkdir -p ~/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ln -s $MY_CFG/dotfiles/vimrc ~/.config/nvim/init.vim
ln -s $MY_CFG/dotfiles/zshrc ~/.zshrc
ln -s $MY_CFG/dotfiles/tmux.conf ~/.tmux.conf
ln -s $MY_CFG/dotfiles/hyper.js ~/.hyper.js
ln -s $MY_CFG/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json

echo "Done."

