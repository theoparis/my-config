-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require("packer").startup(
    function()
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        --use "kabouzeid/nvim-lspinstall"
        use "neovim/nvim-lspconfig"
        -- Code actions
        use {
            "weilbith/nvim-code-action-menu",
            cmd = "CodeActionMenu"
        }
        -- Github Copilot
        --use "github/copilot.vim"
        -- Status Bar
        use {
            "glepnir/galaxyline.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true},
            branch = "main"
        }
        use {
            "folke/todo-comments.nvim",
            config = function()
                require("todo-comments").setup {}
            end
        }
        use "w0rp/ale"
        use {
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require "nvim-tree".setup {}
            end
        }
        use "andweeb/presence.nvim"
        use "ntk148v/vim-horizon"
        use "scrooloose/nerdcommenter"
        use "mattn/emmet-vim"
        use "editorconfig/editorconfig-vim"
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {
            "nvim-telescope/telescope.nvim",
            requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
        }
        use "tjdevries/colorbuddy.nvim"
        use "vim-syntastic/syntastic"
        use "Th3Whit3Wolf/onebuddy"
           use "navarasu/onedark.nvim"
    -- completion engine

        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "ray-x/lsp_signature.nvim"
        use "nvim-lua/lsp-status.nvim"
        use "neoclide/jsonc.vim"
        use "fhill2/floating.nvim"
        --use "creepinson/nvim-proj"
        --use "~/Documents/Code/nvim-proj"
        use {
            "ThePrimeagen/git-worktree.nvim",
            config = function()
                require("git-worktree").setup({})
            end
        }
        use {
            "glacambre/firenvim",
            run = function()
                vim.fn["firenvim#install"](0)
            end
        }
        use "sheerun/vim-polyglot"
        use "metakirby5/codi.vim"
        use "mfussenegger/nvim-dap"
        use "ollykel/v-vim"
        use "earthly/earthly.vim"
        use {
            "nvim-orgmode/orgmode",
            config = function()
                require("orgmode").setup {}
            end
        }
    use "ray-x/lsp_signature.nvim"
    use "nvim-lua/lsp-status.nvim"
    use "neoclide/jsonc.vim"
    use "fhill2/floating.nvim"
    -- use "creepinson/nvim-proj"
    -- use "~/Documents/Code/nvim-proj"
    use {
        "ThePrimeagen/git-worktree.nvim",
        config = function() require("git-worktree").setup({}) end
    }
    use {
        "glacambre/firenvim",
        run = function() vim.fn["firenvim#install"](0) end
    }
    use "metakirby5/codi.vim"
    use "mfussenegger/nvim-dap"
    use "ollykel/v-vim"
    use "earthly/earthly.vim"
    use "simrat39/rust-tools.nvim"
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup {} end
    }
    -- https://github.com/filipdutescu/renamer.nvim/pull/118
    use {"abzcoding/renamer.nvim", requires = {"nvim-lua/plenary.nvim"}}
    use {"LhKipp/nvim-nu", run = ":TSInstall nu"}
    use {"dstein64/vim-startuptime"}
    use "IndianBoy42/tree-sitter-just"
    use {'edluffy/specs.nvim'}
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
    use 'mfussenegger/nvim-jdtls'
    use "udalov/kotlin-vim"
    use 'ggandor/lightspeed.nvim'
end)
