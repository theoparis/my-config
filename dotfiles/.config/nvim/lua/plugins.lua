local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	'https://github.com/folke/which-key.nvim',
	{
		'j-hui/fidget.nvim',
		tag = 'legacy',
		opts = {},
	},
	'https://github.com/neovim/nvim-lspconfig',

	-- Highlighting
	{
		'https://github.com/nvim-treesitter/nvim-treesitter',
		build = function()
			pcall(require('nvim-treesitter.install').update({ with_sync = true }))
		end,
	},
	'nvim-treesitter/nvim-treesitter-textobjects',

	-- Status Bar
	'nvim-lualine/lualine.nvim',

	'lewis6991/gitsigns.nvim',

	-- Code actions
	{ 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
	'folke/todo-comments.nvim',

	-- Fuzzy finder
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
	},

	-- File browser
	'https://github.com/stevearc/oil.nvim',

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
	},

	-- Theme
	'numToStr/Comment.nvim',
	'ThePrimeagen/git-worktree.nvim',
	{ 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap' } },
	'mfussenegger/nvim-dap',
	{
		'nvim-orgmode/orgmode',
		config = function()
			require('orgmode').setup({})
		end,
	},
	'ray-x/lsp_signature.nvim',
	'nvim-lua/lsp-status.nvim',
	'neoclide/jsonc.vim',
	'fhill2/floating.nvim',
	'simrat39/rust-tools.nvim',
	'kyazdani42/nvim-web-devicons',
	'dstein64/vim-startuptime',
	'edluffy/specs.nvim',
	'mfussenegger/nvim-jdtls',
	'udalov/kotlin-vim',
	'ggandor/lightspeed.nvim',
	'stevearc/aerial.nvim',
	'MunifTanjim/nui.nvim',
	'rcarriga/nvim-notify',
	'glepnir/dashboard-nvim',
	'folke/tokyonight.nvim',
	'ThePrimeagen/harpoon',
	'folke/trouble.nvim',
	{
		'IogaMaster/neocord',
		event = 'VeryLazy',
	},
	'https://github.com/mfussenegger/nvim-lint',
	'https://github.com/stevearc/conform.nvim',
	'https://github.com/David-Kunz/gen.nvim',
})
