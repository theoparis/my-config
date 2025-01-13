return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
		config = function()
			vim.cmd.colorscheme('catppuccin-mocha')
		end,
	},
	'https://github.com/folke/which-key.nvim',
	{
		'folke/snacks.nvim',
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			terminal = {},
		},
	},
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{

				'hrsh7th/nvim-cmp',
				dependencies = {
					'hrsh7th/cmp-nvim-lsp',
					'hrsh7th/cmp-buffer',
					'hrsh7th/cmp-path',
					'hrsh7th/cmp-cmdline',
					'L3MON4D3/LuaSnip',
					'saadparwaiz1/cmp_luasnip',
					{
						'L3MON4D3/LuaSnip',
						build = 'make install_jsregexp',
					},
					'saadparwaiz1/cmp_luasnip',
					'hrsh7th/cmp-path',
					'hrsh7th/cmp-buffer',
				},
				config = function()
					require('cmp-config')
				end,
			},
			{ 'folke/neodev.nvim', opts = {} },
			'ray-x/lsp_signature.nvim',
			'nvim-lua/lsp-status.nvim',
		},
		config = function()
			local lsp = require('lspconfig')
			lsp.bacon_ls.setup({
				enable = true,
				settings = {},
			})

			lsp.luau_lsp.setup({
				filetypes = { 'lua', 'luau' },
			})

			lsp.basedpyright.setup({})

			lsp.clangd.setup({})
		end,
	},
	{
		'mrcjkb/rustaceanvim',
		init = function()
			vim.g.rustaceanvim = {
				default_settings = {
					['rust-analyzer'] = {
						diagnostics = { enable = false },
						checkOnSave = { enable = false },
					},
				},
			}
		end,
		lazy = false,
	},
	-- Highlighting
	{
		'https://github.com/nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = function()
			pcall(require('nvim-treesitter.install').update({ with_sync = true }))
		end,
	},

	-- Status Bar
	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				icons_enabled = true,
				theme = 'catppuccin-mocha',
				component_separators = '|',
				section_separators = '',
			},
		},
	},
	'https://github.com/romgrk/barbar.nvim',

	'lewis6991/gitsigns.nvim',

	-- Code actions
	{ 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
	'folke/todo-comments.nvim',

	-- Fuzzy finder
	{
		'ibhagwan/fzf-lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		keys = {
			{ '<leader>f', '<cmd>FzfLua files<cr>', desc = 'Fuzzy Files' },
			{
				'<leader>t',
				'<cmd>FzfLua diagnostics_workspace<cr>',
				desc = 'Fuzzy Diagnostics',
			},
		},
		config = function()
			require('fzf-lua').setup({
				'skim',
			})
		end,
	},

	{
		'echasnovski/mini.nvim',
		version = '*',
		config = function()
			require('mini.files').setup()
		end,
	},

	'numToStr/Comment.nvim',

	{
		'rcarriga/nvim-dap-ui',
		config = function()
			local dapui = require('dapui')
			dapui.setup()
		end,
		keys = {
			{
				'<leader>dbg',
				'<cmd>lua require("dapui").toggle()<cr>',
				desc = 'Debugging',
			},
		},
		dependencies = {
			{
				'mfussenegger/nvim-dap',
				{
					'nvim-orgmode/orgmode',
					config = function()
						require('orgmode').setup({})
					end,
				},
			},
		},
	},
	'fhill2/floating.nvim',
	'edluffy/specs.nvim',
	'https://github.com/mfussenegger/nvim-jdtls',
	'https://github.com/ggandor/lightspeed.nvim',
	'https://github.com/stevearc/aerial.nvim',
	'https://github.com/MunifTanjim/nui.nvim',
	'https://github.com/rcarriga/nvim-notify',
	'glepnir/dashboard-nvim',
	'https://github.com/projekt0n/github-nvim-theme',
	'ThePrimeagen/harpoon',
	{
		'https://github.com/mfussenegger/nvim-lint',
		config = function()
			require('lint').linters_by_ft = {
				javascript = { 'eslint' },
				glsl = { 'glslc' },
				kotlin = { 'ktlint' },
			}
			vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
				callback = function()
					require('lint').try_lint()
				end,
			})
			require('lint').linters.ktlint.args = { '--reporter=json', '--stdin' }
		end,
	},
	{
		'https://github.com/stevearc/conform.nvim',
		config = function()
			require('conform').setup({
				formatters_by_ft = {
					lua = { 'stylua' },
					python = { 'isort', 'ruff' },
					javascript = { 'prettier' },
					json = { 'prettier' },
					rust = { 'rustfmt' },
					kotlin = { 'ktlint' },
					c = { 'clang_format' },
					cpp = { 'clang_format' },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
			vim.api.nvim_create_autocmd('BufWritePost', {
				pattern = '*',
				callback = function(args)
					require('conform').format({ bufnr = args.buf })
				end,
			})
		end,
	},
	'https://github.com/David-Kunz/gen.nvim',
	'https://github.com/nvim-neotest/nvim-nio',
}
