-- Language Server Config
local function setup_servers()
    require "lspinstall".setup()

    require "lspinstall/servers".kotlin =
    {
        install_script = [[
        git clone https://github.com/fwcd/kotlin-language-server.git language-server
        cd language-server
	    ./gradlew :server:installDist
        ]],
        uninstall_script = nil -- can be omitted
    }

    local servers = require "lspinstall".installed_servers()
    for _, server in pairs(servers) do
        require "lspconfig"[server].setup {}
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- Global options
vim.g.mapleader = " "
vim.o.encoding = "UTF-8"
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.whichwrap = vim.o.whichwrap .. "<,>,h,l,[,]"
vim.o.completeopt = "menuone,noselect"
-- Color scheme
require("colorbuddy").colorscheme("material")
vim.g.material_style = "darker"

-- Ale linter
vim.g.ale_fix_on_save = true
vim.g.ale_fixers = {
    javascript = {"eslint"},
    typescript = {"eslint"},
    css = {"prettier"},
    scss = {"prettier"},
    kotlin = {"ktlint"},
    lua = {"luafmt"}
}

vim.g.NERDCreateDefaultMappings = false

vim.g.coc_global_extensions = {
    "coc-json",
    "coc-git",
    "coc-yaml",
    "coc-tsserver",
    "coc-deno",
    "coc-html",
    "coc-lua",
    "coc-pyright",
    "coc-eslint",
    "coc-css",
    "coc-stylelint",
    "coc-go",
    "coc-markdownlint",
    "coc-rust-analyzer",
    "coc-clangd"
}

vim.g.NERDTreeIgnore = {"^node_modules$"}
vim.g.user_emmet_settings = {
    html = {
        snippets = {
            ["html.5"] = '!!!+html>(head>(meta[charset=${charset}]+meta[name="viewport" content="width=device-width,initial-scale=1.0"]+meta[http-equiv="X-UA-Compatible" content="ie=edge"]+title +body'
        }
    }
}
