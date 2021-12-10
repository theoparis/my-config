local cmd = vim.api.nvim_command
local map = vim.api.nvim_set_keymap

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
        local srv = require "lspconfig"[server]
        if srv then
            srv.setup {}
        end
    end
end

--setup_servers()

-- Language server
local pid = vim.fn.getpid()
local lsp = require("lspconfig")
lsp.rust_analyzer.setup {}
lsp.omnisharp.setup {
    cmd = {"/usr/bin/omnisharp", "--languageserver", "--hostPID", tostring(pid)}
}
lsp.svelte.setup {}

lsp.zls.setup {}
lsp.vls.setup {
    cmd = {"/usr/local/bin/vls"}
}
lsp.dockerls.setup {}
lsp.gopls.setup {}
lsp.pylsp.setup {}
lsp.tailwindcss.setup {}
lsp.jsonls.setup {
    settings = {
        json = {
            schemas = {
                {
                    description = "TypeScript compiler configuration file",
                    fileMatch = {"tsconfig.json", "tsconfig.*.json"},
                    url = "http://json.schemastore.org/tsconfig"
                },
                {
                    description = "Lerna config",
                    fileMatch = {"lerna.json"},
                    url = "http://json.schemastore.org/lerna"
                },
                {
                    description = "Babel configuration",
                    fileMatch = {".babelrc.json", ".babelrc", "babel.config.json"},
                    url = "http://json.schemastore.org/lerna"
                },
                {
                    description = "ESLint config",
                    fileMatch = {".eslintrc.json", ".eslintrc"},
                    url = "http://json.schemastore.org/eslintrc"
                },
                {
                    description = "Bucklescript config",
                    fileMatch = {"bsconfig.json"},
                    url = "https://bucklescript.github.io/bucklescript/docson/build-schema.json"
                },
                {
                    description = "Prettier config",
                    fileMatch = {".prettierrc", ".prettierrc.json", "prettier.config.json"},
                    url = "http://json.schemastore.org/prettierrc"
                },
                {
                    description = "Vercel Now config",
                    fileMatch = {"now.json"},
                    url = "http://json.schemastore.org/now"
                },
                {
                    description = "Stylelint config",
                    fileMatch = {".stylelintrc", ".stylelintrc.json", "stylelint.config.json"},
                    url = "http://json.schemastore.org/stylelintrc"
                }
            }
        }
    }
}

--lsp.tsserver.setup(
--{
--cmd = {
--"typescript-language-server",
--"--stdio"
--}
--}
--)
lsp.denols.setup {
    
}
lsp.yamlls.setup(
    {
        format = {
            enable = false
        }
    }
)
--lsp.sumneko_lua.setup({})
lsp.kotlin_language_server.setup {
    settings = {
        kotlin = {
            compiler = {
                jvm = {
                    target = "1.8"
                }
            }
        }
    }
}
lsp.ccls.setup {
    init_options = {
        compilationDatabaseDirectory = "build",
        index = {
            threads = 0
        },
        clang = {
            excludeArgs = {"-frounding-math"}
        }
    }
}

-- Treesitter
require "nvim-treesitter.install".compilers = {"gcc", "clang"}

require "nvim-treesitter.configs".setup {
    ensure_installed = {
        "bash",
        "cpp",
        "comment",
        "css",
        "graphql",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "python",
        "regex",
        "tsx",
        "vue",
        "typescript",
        "kotlin"
    },
    highlight = {enable = true},
    incremental_selection = {enable = true},
    textobjects = {enable = true}
}

-- Global options
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = ";"
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
vim.g.ale_kotlin_ktlint_options = "--disabled_rules=no-unused-imports"
vim.g.ale_lua_luafmt_options = "--stdin"
vim.g.ale_fixers = {
    v = {"vfmt"},
    javascript = {"eslint"},
    typescript = {"eslint"},
    typescriptreact = {"eslint"},
    css = {"prettier"},
    scss = {"prettier"},
    kotlin = {"ktlint"},
    lua = {"luafmt"},
    yaml = {"prettier"},
    json5 = {"prettier"},
    json = {"prettier"},
    jsonc = {"prettier"},
    go = {"gofmt"},
    -- Uses prettier-plugin-toml
    html = {"prettier"},
    python = {"autopep8"},
    cpp = {"clang-format"},
    c = {"clang-format"}
}
vim.g.ale_linters = {
    sh = {"shell"},
    v = {"v"}
}

vim.g.NERDCreateDefaultMappings = false
vim.g.copilot_no_tab_map = true
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

--vim.api.nvim_command("autocmd BufEnter * :lua require('proj').LoadConfig()")
--vim.api.nvim_command("autocmd BufEnter *.ts :lua require('proj.deno').DetectDeno()")
vim.api.nvim_command("autocmd BufRead,BufNewFile Earthfile set filetype=Earthfile")
vim.api.nvim_command("autocmd BufRead,BufNewFile build.earth set filetype=Earthfile")

require("telescope").load_extension("git_worktree")
