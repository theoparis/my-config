local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'mkdir',
		'-p',
		lazypath,
	})
	vim.fn.system({
		'gix',
		'clone',
		'https://github.com/folke/lazy.nvim.git',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	'folke/which-key.nvim',
	{
		'j-hui/fidget.nvim',
		tag = 'legacy',
		opts = {},
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'jose-elias-alvarez/null-ls.nvim',
		},
	},

	-- Highlighting
	{
		'nvim-treesitter/nvim-treesitter',
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
	'nvim-telescope/telescope-file-browser.nvim',

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
	-- use "creepinson/nvim-proj"
	-- use "~/Documents/Code/nvim-proj"
	'earthly/earthly.vim',
	'simrat39/rust-tools.nvim',
	'kyazdani42/nvim-web-devicons',
	'LhKipp/nvim-nu',
	'dstein64/vim-startuptime',
	'edluffy/specs.nvim',
	'mfussenegger/nvim-jdtls',
	'udalov/kotlin-vim',
	'ggandor/lightspeed.nvim',
	'stevearc/aerial.nvim',
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		opts = {},
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
	},
	'glepnir/dashboard-nvim',
	'romgrk/barbar.nvim',
	'simrat39/inlay-hints.nvim',
	'folke/tokyonight.nvim',
	'ThePrimeagen/harpoon',
	'folke/trouble.nvim',
	'cuffedme/web_presence.nvim',
	{
		'sourcegraph/sg.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
})
