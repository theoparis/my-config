local cmd = vim.api.nvim_command
local map = vim.api.nvim_set_keymap

vim.notify = require("notify")

local lsp = require("lspconfig")
local configs = require("lspconfig.configs")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
if not configs.ls_emmet then
	configs.ls_emmet = {
		default_config = {
			cmd = { "emmet-ls", "--stdio" },
			filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"haml",
				"xml",
				"xsl",
				"pug",
				"slim",
				"sass",
				"stylus",
				"less",
				"sss",
				"hbs",
				"handlebars",
			},
			root_dir = function()
				return vim.loop.cwd()
			end,
			settings = {},
		},
	}
end

local make_lsp_config = function(config1)
	local config2 = {
		capabilities = capabilities,
		on_attach = function(client)
			local group = vim.api.nvim_create_augroup("lsp_formatting", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePre", {
				command = ":lua vim.lsp.buf.format({}, 1000)",
				group = group,
			})
			--vim.notify(
			--string.format("[lsp] %s\n[cwd] %s", client.name, vim.fn.getcwd()),
			--"info",
			--{ title = "Lsp Active", timeout = 1000 },
			--true
			--)
		end,
	}

	local config = {}

	for k, v in pairs(config1) do
		config[k] = v
	end
	for k, v in pairs(config2) do
		config[k] = v
	end

	return config
end

lsp.kotlin_language_server.setup(make_lsp_config({}))
lsp.efm.setup(make_lsp_config({
	init_options = { documentFormatting = true },
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			lua = {
				{ formatCommand = "stylua --color Never -", formatStdin = true },
			},
			rust = {
				{ formatCommand = "rustfmt -", formatStdin = true },
			},
			python = {
				{ formatCommand = "black -", formatStdin = true },
			},
		},
	},
}))
lsp.rnix.setup(make_lsp_config({}))
lsp.fortls.setup(make_lsp_config({}))
lsp.ls_emmet.setup(make_lsp_config({}))
lsp.vala_ls.setup(make_lsp_config({}))
lsp.html.setup(make_lsp_config({}))
lsp.rust_analyzer.setup(make_lsp_config({
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				allFeatures = true,
				overrideCommand = {
					"cargo",
					"clippy",
					"--workspace",
					"--message-format=json",
					"--all-targets",
					"--all-features",
				},
			},
		},
	},
}))
lsp.csharp_ls.setup(make_lsp_config({}))
lsp.nimls.setup(make_lsp_config({}))
lsp.svelte.setup(make_lsp_config({}))
lsp.typeprof.setup(make_lsp_config({}))
lsp.crystalline.setup(make_lsp_config({}))
lsp.zls.setup(make_lsp_config({}))
lsp.jdtls.setup(make_lsp_config({ cmd = { "java-lsp.sh", lsp.util.root_pattern("pom.xml", "build.gradle") } }))
lsp.dockerls.setup(make_lsp_config({}))
lsp.gopls.setup(make_lsp_config({}))
lsp.pyright.setup(make_lsp_config({}))
lsp.sumneko_lua.setup(make_lsp_config({
	settings = {
		Lua = {
			runtime = { version = "Lua5.4", path = runtime_path },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
}))
lsp.tailwindcss.setup(make_lsp_config({}))
lsp.jsonls.setup(make_lsp_config({
	settings = {
		json = {
			schemas = {
				{
					description = "TypeScript compiler configuration file",
					fileMatch = { "tsconfig.json", "tsconfig.*.json" },
					url = "http://json.schemastore.org/tsconfig",
				},
				{
					description = "Lerna config",
					fileMatch = { "lerna.json" },
					url = "http://json.schemastore.org/lerna",
				},
				{
					description = "Babel configuration",
					fileMatch = {
						".babelrc.json",
						".babelrc",
						"babel.config.json",
					},
					url = "http://json.schemastore.org/lerna",
				},
				{
					description = "ESLint config",
					fileMatch = { ".eslintrc.json", ".eslintrc" },
					url = "http://json.schemastore.org/eslintrc",
				},
				{
					description = "Bucklescript config",
					fileMatch = { "bsconfig.json" },
					url = "https://bucklescript.github.io/bucklescript/docson/build-schema.json",
				},
				{
					description = "Prettier config",
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json",
					},
					url = "http://json.schemastore.org/prettierrc",
				},
				{
					description = "Vercel Now config",
					fileMatch = { "now.json" },
					url = "http://json.schemastore.org/now",
				},
				{
					description = "Stylelint config",
					fileMatch = {
						".stylelintrc",
						".stylelintrc.json",
						"stylelint.config.json",
					},
					url = "http://json.schemastore.org/stylelintrc",
				},
			},
		},
	},
}))

lsp.tsserver.setup({
	cmd = {
		"typescript-language-server",
		"--stdio",
	},
})
--lsp.denols.setup(make_lsp_config({}))
lsp.yamlls.setup(make_lsp_config({ capabilities = capabilities, format = { enable = false } }))
-- lsp.sumneko_lua.setup({})
lsp.clangd.setup(make_lsp_config({}))

-- Treesitter
require("nvim-treesitter.install").compilers = { "gcc", "clang" }

require("nvim-treesitter.configs").setup({
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
		"kotlin",
	},
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})

-- Global options
vim.o.winbar = "%{%v:lua.require('utils.win').eval()%}"
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = ";"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.encoding = "UTF-8"
vim.o.expandtab = false
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 4
vim.o.whichwrap = vim.o.whichwrap .. "<,>,h,l,[,]"
vim.o.completeopt = "menuone,noselect"
vim.wo.number = true

-- Color scheme
vim.g.material_style = "deep ocean"
require("colorbuddy").setup()
require("colorbuddy").colorscheme("material")

vim.g.NERDCreateDefaultMappings = false
vim.g.copilot_no_tab_map = true
vim.g.NERDTreeIgnore = { "^node_modules$" }
vim.g.user_emmet_settings = {
	html = {
		snippets = {
			["html.5"] = '!!!+html>(head>(meta[charset=${charset}]+meta[name="viewport" content="width=device-width,initial-scale=1.0"]+meta[http-equiv="X-UA-Compatible" content="ie=edge"]+title +body',
		},
	},
}

-- File types
vim.api.nvim_command("autocmd BufNewFile,BufRead *.jsonc,*.json,*.json5 setfiletype jsonc")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.razor setfiletype xml")
vim.api.nvim_command("au BufRead,BufNewFile *.csx set filetype=cs")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.jsonc,*.json,*.json5 setfiletype jsonc")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.razor setfiletype xml")
vim.api.nvim_command("au BufRead,BufNewFile *.csx set filetype=cs")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.jsonc,*.json,*.json5 setfiletype jsonc")
vim.api.nvim_command("autocmd BufRead,BufNewFile *.java lua require'jdtls_setup'.setup()")

-- Status bar

function LspStatus()
	if vim.lsp.buf_get_clients() > 0 then
		return require("lsp-status").status()
	end

	return ""
end

local lsp_status = require("lsp-status")

lsp_status.config({
	indicator_errors = "❌",
	indicator_warnings = "⚠️",
	indicator_info = "ℹ️",
	indicator_hint = "❔",
	indicator_ok = "👌",
})

lsp_status.register_progress()

-- vim.api.nvim_command("autocmd BufEnter * :lua require('proj').LoadConfig()")
-- vim.api.nvim_command("autocmd BufEnter *.ts :lua require('proj.deno').DetectDeno()")
vim.api.nvim_command("autocmd BufRead,BufNewFile Earthfile set filetype=Earthfile")
vim.api.nvim_command("autocmd BufRead,BufNewFile build.earth set filetype=Earthfile")

require("todo-comments").setup()
require("telescope").load_extension("git_worktree")

require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	sidebar = {
		-- You can change the order of elements in the sidebar
		elements = {
			-- Provide as ID strings or tables with "id" and "size" keys
			{
				id = "scopes",
				size = 0.25, -- Can be float or integer > 1
			},
			{ id = "breakpoints", size = 0.25 },
			{ id = "stacks", size = 0.25 },
			{ id = "watches", size = 00.25 },
		},
		size = 40,
		position = "left", -- Can be "left", "right", "top", "bottom"
	},
	tray = {
		elements = { "repl" },
		size = 10,
		position = "bottom", -- Can be "left", "right", "top", "bottom"
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = { close = { "q", "<Esc>" } },
	},
	windows = { indent = 1 },
})
require("inc_rename").setup()
require("nvim-tree").setup({})
require("aerial").setup()
