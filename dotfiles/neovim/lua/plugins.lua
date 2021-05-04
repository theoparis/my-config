-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require("packer").startup(
    function()
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup {}
            end
        }
        use "kabouzeid/nvim-lspinstall"
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
        use "tiagofumo/vim-nerdtree-syntax-highlight"
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {
            "nvim-telescope/telescope.nvim",
            requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
        }
        -- compe
        use "tjdevries/colorbuddy.nvim"
        use "vim-syntastic/syntastic"
        use "Th3Whit3Wolf/onebuddy"
        use "hrsh7th/nvim-compe"
        use "nvim-lua/lsp-status.nvim"
        use "neoclide/jsonc.vim"
    end
)
