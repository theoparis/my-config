vim.notify = require('notify')

local lsp = require('lspconfig')
local configs = require('lspconfig.configs')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
if not configs.ls_emmet then
	configs.ls_emmet = {
		default_config = {
			cmd = { 'emmet-ls', '--stdio' },
			filetypes = {
				'html',
				'css',
				'scss',
				'javascriptreact',
				'typescriptreact',
				'haml',
				'xml',
				'xsl',
				'pug',
				'slim',
				'sass',
				'stylus',
				'less',
				'sss',
				'hbs',
				'handlebars',
				'fish',
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
		on_attach = function(client, bufnr)

			--vim.api.nvim_create_autocmd('BufWritePre', {
			--command = ':lua vim.lsp.buf.format({}, 1000)',
			--group = group,
			--})
			-- inlay hints
			--ih.on_attach(client, buf)

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
lsp.julials.setup(make_lsp_config({}))
lsp.kotlin_language_server.setup(make_lsp_config({}))
lsp.rnix.setup(make_lsp_config({}))
lsp.fortls.setup(make_lsp_config({}))
lsp.ls_emmet.setup(make_lsp_config({}))
lsp.vala_ls.setup(make_lsp_config({}))
lsp.html.setup(make_lsp_config({}))
lsp.rust_analyzer.setup(make_lsp_config({
	settings = {
		['rust-analyzer'] = {
			checkOnSave = {
				allFeatures = true,
				overrideCommand = {
					'cargo',
					'clippy',
					'--workspace',
					'--message-format=json',
					'--all-targets',
					'--all-features',
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
lsp.jdtls.setup(make_lsp_config({ cmd = { 'java-lsp.sh', vim.fn.getcwd() } }))
lsp.dockerls.setup(make_lsp_config({}))
lsp.gopls.setup(make_lsp_config({
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
}))
lsp.pyright.setup(make_lsp_config({}))
lsp.sumneko_lua.setup(make_lsp_config({
	settings = {
		Lua = {
			runtime = { version = 'Lua5.4', path = runtime_path },
			diagnostics = { globals = { 'vim' } },
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
			hint = {
				enable = true,
			},
		},
	},
}))
lsp.tailwindcss.setup(make_lsp_config({}))
lsp.jsonls.setup(make_lsp_config({
	settings = {
		json = {
			schemas = {
				{
					description = 'TypeScript compiler configuration file',
					fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
					url = 'http://json.schemastore.org/tsconfig',
				},
				{
					description = 'Lerna config',
					fileMatch = { 'lerna.json' },
					url = 'http://json.schemastore.org/lerna',
				},
				{
					description = 'Babel configuration',
					fileMatch = {
						'.babelrc.json',
						'.babelrc',
						'babel.config.json',
					},
					url = 'http://json.schemastore.org/lerna',
				},
				{
					description = 'ESLint config',
					fileMatch = { '.eslintrc.json', '.eslintrc' },
					url = 'http://json.schemastore.org/eslintrc',
				},
				{
					description = 'Bucklescript config',
					fileMatch = { 'bsconfig.json' },
					url = 'https://bucklescript.github.io/bucklescript/docson/build-schema.json',
				},
				{
					description = 'Prettier config',
					fileMatch = {
						'.prettierrc',
						'.prettierrc.json',
						'prettier.config.json',
					},
					url = 'http://json.schemastore.org/prettierrc',
				},
				{
					description = 'Vercel Now config',
					fileMatch = { 'now.json' },
					url = 'http://json.schemastore.org/now',
				},
				{
					description = 'Stylelint config',
					fileMatch = {
						'.stylelintrc',
						'.stylelintrc.json',
						'stylelint.config.json',
					},
					url = 'http://json.schemastore.org/stylelintrc',
				},
			},
		},
	},
}))

lsp.tsserver.setup({
	cmd = {
		'typescript-language-server',
		'--stdio',
	},
	settings = {
		javascript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
		typescript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = 'all',
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
	},
})
--lsp.denols.setup(make_lsp_config({}))
lsp.yamlls.setup(
	make_lsp_config({ capabilities = capabilities, format = { enable = false } })
)
-- lsp.sumneko_lua.setup({})
lsp.clangd.setup(make_lsp_config({}))

-- Treesitter
require('nvim-treesitter.install').compilers = { 'gcc', 'clang' }
require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'bash',
		'cpp',
		'comment',
		'css',
		'graphql',
		'html',
		'javascript',
		'jsdoc',
		'json',
		'lua',
		'python',
		'regex',
		'tsx',
		'vue',
		'typescript',
		'kotlin',
		'java',
		'zig',
		'rust',
	},
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})

-- Global options
vim.o.winbar = "%{%v:lua.require('utils.win').eval()%}"
vim.o.clipboard = 'unnamedplus'
vim.o.ignorecase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.expandtab = false
vim.o.autoindent = true
vim.o.updatetime = 100
vim.o.whichwrap = vim.o.whichwrap .. '<,>,h,l,[,]'
vim.g.mapleader = ' '
vim.o.termguicolors = true

-- Color scheme
vim.g.material_style = 'deep ocean'
require('colorbuddy').setup()
require('colorbuddy').colorscheme('material')

vim.g.NERDCreateDefaultMappings = false
vim.g.copilot_no_tab_map = true
vim.g.NERDTreeIgnore = { '^node_modules$' }

-- File types
--vim.api.nvim_command(
--'autocmd BufNewFile,BufRead *.jsonc,*.json,*.json5 setfiletype jsonc'
--)
--vim.api.nvim_command('autocmd BufNewFile,BufRead *.razor setfiletype xml')
--vim.api.nvim_command('au BufRead,BufNewFile *.csx set filetype=cs')
--vim.api.nvim_command(
--'autocmd BufNewFile,BufRead *.jsonc,*.json,*.json5 setfiletype jsonc'
--)
--vim.api.nvim_command('autocmd BufNewFile,BufRead *.razor setfiletype xml')
--vim.api.nvim_command('au BufRead,BufNewFile *.csx set filetype=cs')
--vim.api.nvim_command(
--'autocmd BufNewFile,BufRead *.jsonc,*.json,*.json5 setfiletype jsonc'
--)
--vim.api.nvim_command(
--"autocmd BufRead,BufNewFile *.java lua require'jdtls_setup'.setup()"
--)

-- Status bar

function LspStatus()
	if vim.lsp.buf_get_clients() > 0 then
		return require('lsp-status').status()
	end

	return ''
end

local lsp_status = require('lsp-status')

lsp_status.config({
	indicator_errors = '❌',
	indicator_warnings = '⚠️',
	indicator_info = 'ℹ️',
	indicator_hint = '❔',
	indicator_ok = '👌',
})

lsp_status.register_progress()

-- vim.api.nvim_command("autocmd BufEnter * :lua require('proj').LoadConfig()")
-- vim.api.nvim_command("autocmd BufEnter *.ts :lua require('proj.deno').DetectDeno()")
vim.api.nvim_command(
	'autocmd BufRead,BufNewFile Earthfile set filetype=Earthfile'
)
vim.api.nvim_command(
	'autocmd BufRead,BufNewFile build.earth set filetype=Earthfile'
)

require('todo-comments').setup()
require('dapui').setup({})
require('nvim-tree').setup({})
require('aerial').setup()
require('git-worktree').setup({})
require('orgmode').setup_ts_grammar()

require('presence'):setup()
require('tabline').setup({
	enable = true,
	options = {
		section_separators = { '', '' },
		component_separators = { '', '' },
		max_bufferline_percent = 66,
		show_tabs_always = false,
		show_devicons = true,
		show_bufnr = false,
		show_filename_only = false,
		modified_icon = '+ ',
		modified_italic = false,
		show_tabs_only = false,
	},
})
vim.cmd([[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in session
]])

local db = require('dashboard')
db.custom_header = {
	'',
	'',
	'',
	'',
	' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
	' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
	' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
	' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
	' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
	' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
	'',
	'',
	'',
}
db.custom_center = {
	{
		icon = ' ',
		desc = 'New File            ',
		action = 'DashboardNewFile',
		shortcut = 'SPC o',
	},
	{
		icon = ' ',
		desc = 'Browse Files        ',
		action = 'Telescope file_browser',
		shortcut = 'SPC n',
	},
	{
		icon = ' ',
		desc = 'Find File           ',
		action = 'Telescope find_files',
		shortcut = 'SPC f',
	},
	{
		icon = ' ',
		desc = 'Configure Neovim    ',
		action = 'edit ~/.config/nvim/lua/init.lua',
		shortcut = 'SPC v',
	},
	{
		icon = ' ',
		desc = 'Exit Neovim              ',
		action = 'quit',
	},
}
vim.keymap.set('n', '<Leader>o', ':DashboardNewFile<CR>', { silent = true })

function LspRename()
	local curr_name = vim.fn.expand('<cword>')
	local value = vim.fn.input('LSP Rename: ', curr_name)
	local lsp_params = vim.lsp.util.make_position_params()

	if not value or #value == 0 or curr_name == value then
		return
	end

	-- request lsp rename
	lsp_params.newName = value
	vim.lsp.buf_request(
		0,
		'textDocument/rename',
		lsp_params,
		function(_, res, ctx, _)
			if not res then
				return
			end

			-- apply renames
			local client = vim.lsp.get_client_by_id(ctx.client_id)
			vim.lsp.util.apply_workspace_edit(res, client.offset_encoding)

			-- print renames
			local changed_files_count = 0
			local changed_instances_count = 0

			if res.documentChanges then
				for _, changed_file in pairs(res.documentChanges) do
					changed_files_count = changed_files_count + 1
					changed_instances_count = changed_instances_count
						+ #changed_file.edits
				end
			elseif res.changes then
				for _, changed_file in pairs(res.changes) do
					changed_instances_count = changed_instances_count + #changed_file
					changed_files_count = changed_files_count + 1
				end
			end

			-- compose the right print message
			print(
				string.format(
					'renamed %s instance%s in %s file%s. %s',
					changed_instances_count,
					changed_instances_count == 1 and '' or 's',
					changed_files_count,
					changed_files_count == 1 and '' or 's',
					changed_files_count > 1 and "To save them run ':wa'" or ''
				)
			)
		end
	)
end

local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.csharpier,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.yapf,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				'xml',
				'java',
				'javascript',
				'javascriptreact',
				'typescript',
				'typescriptreact',
				'vue',
				'css',
				'scss',
				'less',
				'html',
				'json',
				'jsonc',
				'yaml',
				'markdown',
				'graphql',
				'handlebars',
				'svelte',
			},
		}),
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.rufo,
		null_ls.builtins.diagnostics.clang_check,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.zigfmt,
	},
	on_attach = function(client, bufnr)
		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == 'null-ls'
						end,
					})
				end,
			})
		end
	end,
})
