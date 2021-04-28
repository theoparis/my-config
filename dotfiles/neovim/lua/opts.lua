vim.g.mapleader = " "
vim.o.encoding = "UTF-8"
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.whichwrap = vim.o.whichwrap .. "<,>,[,]"
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

vim.g.NERDTreeIgnore = {"^node_modules$"}
vim.g.user_emmet_settings = {
    html = {
        snippets = {
            ["html.5"] = '!!!+html>(head>(meta[charset=${charset}]+meta[name="viewport" content="width=device-width,initial-scale=1.0"]+meta[http-equiv="X-UA-Compatible" content="ie=edge"]+title +body'
        }
    }
}

local nvim_lsp = require("lspconfig")
nvim_lsp.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end
}
nvim_lsp.pyright.setup{}
nvim_lsp.kotlin_language_server.setup{}
nvim_lsp.gopls.setup{}
nvim_lsp.denols.setup{}
nvim_lsp.rls.setup {
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    },
}

local saga = require("lspsaga")
saga.init_lsp_saga {

}

