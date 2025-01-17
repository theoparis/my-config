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
		keys = {
			{
				'<leader>,',
				function()
					Snacks.picker.buffers()
				end,
				desc = 'Buffers',
			},
			{
				'<leader>/',
				function()
					Snacks.picker.grep()
				end,
				desc = 'Grep',
			},
			{
				'<leader>:',
				function()
					Snacks.picker.command_history()
				end,
				desc = 'Command History',
			},
			-- find
			{
				'<leader>fb',
				function()
					Snacks.picker.buffers()
				end,
				desc = 'Buffers',
			},
			{
				'<leader>fc',
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
				end,
				desc = 'Find Config File',
			},
			{
				'<leader>ff',
				function()
					Snacks.picker.files()
				end,
				desc = 'Find Files',
			},
			{
				'<leader>fg',
				function()
					Snacks.picker.git_files()
				end,
				desc = 'Find Git Files',
			},
			{
				'<leader>fr',
				function()
					Snacks.picker.recent()
				end,
				desc = 'Recent',
			},
			-- git
			{
				'<leader>gc',
				function()
					Snacks.picker.git_log()
				end,
				desc = 'Git Log',
			},
			{
				'<leader>gs',
				function()
					Snacks.picker.git_status()
				end,
				desc = 'Git Status',
			},
			-- Grep
			{
				'<leader>sb',
				function()
					Snacks.picker.lines()
				end,
				desc = 'Buffer Lines',
			},
			{
				'<leader>sB',
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = 'Grep Open Buffers',
			},
			{
				'<leader>sg',
				function()
					Snacks.picker.grep()
				end,
				desc = 'Grep',
			},
			{
				'<leader>sw',
				function()
					Snacks.picker.grep_word()
				end,
				desc = 'Visual selection or word',
				mode = { 'n', 'x' },
			},
			-- search
			{
				'<leader>s"',
				function()
					Snacks.picker.registers()
				end,
				desc = 'Registers',
			},
			{
				'<leader>sa',
				function()
					Snacks.picker.autocmds()
				end,
				desc = 'Autocmds',
			},
			{
				'<leader>sc',
				function()
					Snacks.picker.command_history()
				end,
				desc = 'Command History',
			},
			{
				'<leader>sC',
				function()
					Snacks.picker.commands()
				end,
				desc = 'Commands',
			},
			{
				'<leader>sd',
				function()
					Snacks.picker.diagnostics()
				end,
				desc = 'Diagnostics',
			},
			{
				'<leader>sh',
				function()
					Snacks.picker.help()
				end,
				desc = 'Help Pages',
			},
			{
				'<leader>sH',
				function()
					Snacks.picker.highlights()
				end,
				desc = 'Highlights',
			},
			{
				'<leader>sj',
				function()
					Snacks.picker.jumps()
				end,
				desc = 'Jumps',
			},
			{
				'<leader>sk',
				function()
					Snacks.picker.keymaps()
				end,
				desc = 'Keymaps',
			},
			{
				'<leader>sl',
				function()
					Snacks.picker.loclist()
				end,
				desc = 'Location List',
			},
			{
				'<leader>sM',
				function()
					Snacks.picker.man()
				end,
				desc = 'Man Pages',
			},
			{
				'<leader>sm',
				function()
					Snacks.picker.marks()
				end,
				desc = 'Marks',
			},
			{
				'<leader>sR',
				function()
					Snacks.picker.resume()
				end,
				desc = 'Resume',
			},
			{
				'<leader>sq',
				function()
					Snacks.picker.qflist()
				end,
				desc = 'Quickfix List',
			},
			{
				'<leader>uC',
				function()
					Snacks.picker.colorschemes()
				end,
				desc = 'Colorschemes',
			},
			{
				'<leader>qp',
				function()
					Snacks.picker.projects()
				end,
				desc = 'Projects',
			},
			-- LSP
			{
				'gd',
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = 'Goto Definition',
			},
			{
				'gr',
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = 'References',
			},
			{
				'gI',
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = 'Goto Implementation',
			},
			{
				'gy',
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = 'Goto T[y]pe Definition',
			},
			{
				'<leader>ss',
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = 'LSP Symbols',
			},
		},
	},
	{
		'rachartier/tiny-inline-diagnostic.nvim',
		event = 'LspAttach',
		dependencies = {
			'neovim/nvim-lspconfig',
			'mrcjkb/rustaceanvim',
		},
		init = function()
			require('tiny-inline-diagnostic').setup({
				options = {
					throttle = 20,
					multiple_diag_under_cursor = true,
					show_all_diags_on_cursorline = true,
					enable_on_insert = true,
					multilines = {
						enabled = true,
						always_show = true,
					},
				},
			})
			vim.diagnostic.config({ virtual_text = false })
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
			})

			lsp.luau_lsp.setup({
				filetypes = { 'lua', 'luau' },
			})

			lsp.nil_ls.setup({})

			lsp.basedpyright.setup({})

			lsp.clangd.setup({})
		end,
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
	{
		'https://github.com/romgrk/barbar.nvim',
		dependencies = {
			'https://github.com/nvim-tree/nvim-web-devicons',
		},
	},

	'lewis6991/gitsigns.nvim',

	-- Code actions
	{ 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
	'folke/todo-comments.nvim',

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
					nix = { 'nixfmt' },
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
