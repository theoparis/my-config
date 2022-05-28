local cmd = vim.api.nvim_command
local map = vim.api.nvim_set_keymap

local lsp = require("lspconfig")
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("nvim-tree").setup({})
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
lsp.vala_ls.setup({})
lsp.rust_analyzer.setup({
	capabilities = capabilities,
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
})
lsp.csharp_ls.setup({ capabilities = capabilities })
lsp.nimls.setup({ capabilities = capabilities })
lsp.svelte.setup({ capabilities = capabilities })
lsp.typeprof.setup({ capabilities = capabilities })
lsp.crystalline.setup({ capabilities = capabilities })
lsp.zls.setup({ capabilities = capabilities })
lsp.vls.setup({ capabilities = capabilities, cmd = { "/usr/local/bin/vls" } })
lsp.jdtls.setup({ capabilities = capabilities, cmd = { "java-lsp.sh" } })
lsp.dockerls.setup({ capabilities = capabilities })
lsp.gopls.setup({ capabilities = capabilities })
lsp.pylsp.setup({ capabilities = capabilities })
lsp.sumneko_lua.setup({
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
})
lsp.tailwindcss.setup({ capabilities = capabilities })
lsp.jsonls.setup({
	capabilities = capabilities,
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
})

lsp.tsserver.setup({
	cmd = {
		"typescript-language-server",
		"--stdio",
	},
})
--lsp.denols.setup({ capabilities = capabilities })
lsp.yamlls.setup({ capabilities = capabilities, format = { enable = false } })
-- lsp.sumneko_lua.setup({})
lsp.clangd.setup({ capabilities = capabilities })

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
-- Color scheme
vim.g.material_style = "deep ocean"
require("colorbuddy").setup()
require("colorbuddy").colorscheme("material")

-- Ale linter
vim.g.ale_fix_on_save = true
vim.g.ale_fixers = {
	zsh = { "shfmt" },
	sh = { "shfmt" },
	vala = { "uncrustify" },
	v = { "vfmt" },
	cs = { "dotnet-format" },
	ruby = { "rubocop" },
	javascript = { "prettier" },
	typescript = { "prettier" },
	typescriptreact = { "prettier" },
	svelte = { "prettier" },
	css = { "prettier" },
	scss = { "prettier" },
	kotlin = { "ktlint" },
	lua = { "stylua" },
	yaml = { "prettier" },
	json5 = { "prettier" },
	json = { "prettier" },
	jsonc = { "prettier" },
	go = { "gofmt" },
	-- Uses prettier-plugin-toml
	python = { "black" },
	rust = { "rustfmt" },
	cpp = { "clang-format" },
	c = { "clang-format" },
}
vim.g.ale_linters = { v = { "v" } }

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

require("telescope").load_extension("git_worktree")

local mappings_utils = require("renamer.mappings.utils")
require("renamer").setup({
	-- The popup title, shown if `border` is true
	title = "Rename",
	-- The padding around the popup content
	padding = { top = 0, left = 0, bottom = 0, right = 0 },
	-- The minimum width of the popup
	min_width = 15,
	-- The maximum width of the popup
	max_width = 45,
	-- Whether or not to shown a border around the popup
	border = true,
	-- The characters which make up the border
	border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	-- Whether or not to highlight the current word references through LSP
	show_refs = true,
	-- Whether or not to add resulting changes to the quickfix list
	with_qf_list = true,
	-- Whether or not to enter the new name through the UI or Neovim's `input`
	-- prompt
	with_popup = true,
	-- The keymaps available while in the `renamer` buffer. The example below
	-- overrides the default values, but you can add others as well.
	mappings = {
		["<c-i>"] = mappings_utils.set_cursor_to_start,
		["<c-a>"] = mappings_utils.set_cursor_to_end,
		["<c-e>"] = mappings_utils.set_cursor_to_word_end,
		["<c-b>"] = mappings_utils.set_cursor_to_word_start,
		["<c-c>"] = mappings_utils.clear_line,
		["<c-u>"] = mappings_utils.undo,
		["<c-r>"] = mappings_utils.redo,
	},
	-- Custom handler to be run after successfully renaming the word. Receives
	-- the LSP 'textDocument/rename' raw response as its parameter.
	handler = nil,
})

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

local mappings_utils = require("renamer.mappings.utils")
require("renamer").setup({
	-- The popup title, shown if `border` is true
	title = "Rename",
	-- The padding around the popup content
	padding = { top = 0, left = 0, bottom = 0, right = 0 },
	-- The minimum width of the popup
	min_width = 15,
	-- The maximum width of the popup
	max_width = 45,
	-- Whether or not to shown a border around the popup
	border = true,
	-- The characters which make up the border
	border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	-- Whether or not to highlight the current word references through LSP
	show_refs = true,
	-- Whether or not to add resulting changes to the quickfix list
	with_qf_list = true,
	-- Whether or not to enter the new name through the UI or Neovim's `input`
	-- prompt
	with_popup = true,
	-- The keymaps available while in the `renamer` buffer. The example below
	-- overrides the default values, but you can add others as well.
	mappings = {
		["<c-i>"] = mappings_utils.set_cursor_to_start,
		["<c-a>"] = mappings_utils.set_cursor_to_end,
		["<c-e>"] = mappings_utils.set_cursor_to_word_end,
		["<c-b>"] = mappings_utils.set_cursor_to_word_start,
		["<c-c>"] = mappings_utils.clear_line,
		["<c-u>"] = mappings_utils.undo,
		["<c-r>"] = mappings_utils.redo,
	},
	-- Custom handler to be run after successfully renaming the word. Receives
	-- the LSP 'textDocument/rename' raw response as its parameter.
	handler = nil,
})

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
