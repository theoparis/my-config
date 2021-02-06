curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
ln -s ~/my-config/dotfiles/vimrc ~/.config/nvim/init.vim
ln -s ~/my-config/dotfiles/zshrc ~/.zshrc

