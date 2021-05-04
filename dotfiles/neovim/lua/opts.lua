-- Language Server Config
local function setup_servers()
    require "lspinstall".setup()

    require "lspinstall/servers".kotlin = {
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
require("colorbuddy").colorscheme("onebuddy")
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

-- File types
vim.api.nvim_command("autocmd BufNewFile,BufRead *.jsonc,*.json,*.json5 setfiletype jsonc")

-- Status bar

function LspStatus()
    if vim.lsp.buf_get_clients() > 0 then
        return require("lsp-status").status()
    end

    return ""
end

vim.g.lightline = {
    colorscheme = "material",
    component = {
        lineinfo = "%3l/%1L:%-2c"
    },
    active = {
        left = {
            {
                "mode",
                "paste"
            },
            {
                "readonly",
                "filename"
            }
        },
        right = {
            {
                "lineinfo"
            },
            {
                "filetype"
            },
            {
                "lsp_status"
            }
        }
    },
    component_function = {
        filename = "LightlineFilename",
        lsp_diagnostics_hints = "LspHints",
        lsp_diagnostics_warnings = "LspWarnings",
        lsp_status = "LspStatus"
    }
}

local lsp_status = require("lsp-status")

lsp_status.config(
    {
        indicator_errors = "❌",
        indicator_warnings = "⚠️",
        indicator_info = "ℹ️",
        indicator_hint = "❔",
        indicator_ok = "👌"
    }
)

lsp_status.register_progress()
