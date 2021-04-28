-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require("packer").startup(
    function()
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        use "neovim/nvim-lspconfig"
        use "glepnir/lspsaga.nvim"
        use "itchyny/lightline.vim"
        use "w0rp/ale"
        use "preservim/nerdtree"
        use "hugolgst/vimsence"
        use "ntk148v/vim-horizon"
        use "scrooloose/nerdcommenter"
        use "mattn/emmet-vim"
        use "editorconfig/editorconfig-vim"
        use "ryanoasis/vim-devicons"
        use "junegunn/fzf.vim"
        use "tiagofumo/vim-nerdtree-syntax-highlight"
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use "hrsh7th/nvim-compe"
        use "tjdevries/colorbuddy.nvim"
        use "vim-syntastic/syntastic"
        use "marko-cerovac/material.nvim"
    end
)
