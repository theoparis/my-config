local status, packer = pcall(require, 'packer')

if not status then
	print('packer.nvim is not installed')
	return
end

-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return packer.startup(function()
	-- Packer can manage itself
	use('wbthomason/packer.nvim')
	use('jose-elias-alvarez/null-ls.nvim')
	use('andweeb/presence.nvim')
	use({ 'neovim/nvim-lspconfig' })
	-- Code actions
	use({ 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' })
	-- Status Bar
	use('nvim-lualine/lualine.nvim')
	use('folke/todo-comments.nvim')
	use('kyazdani42/nvim-tree.lua')
	use('scrooloose/nerdcommenter')
	use('editorconfig/editorconfig-vim')
	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use({
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
	})
	use('nvim-telescope/telescope-file-browser.nvim')
	use('tjdevries/colorbuddy.nvim')
	use('Th3Whit3Wolf/onebuddy')
	use('marko-cerovac/material.nvim')
	-- completion engine

	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-cmdline')
	-- snippet engine
	use('saadparwaiz1/cmp_luasnip')
	use('L3MON4D3/LuaSnip')

	-- use "theoparis/nvim-proj"
	use({
		'ThePrimeagen/git-worktree.nvim',
	})
	use({
		'glacambre/firenvim',
		run = function()
			vim.fn['firenvim#install'](0)
		end,
	})
	use('metakirby5/codi.vim')
	use({ 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } })
	use('mfussenegger/nvim-dap')
	use({
		'nvim-orgmode/orgmode',
		config = function()
			require('orgmode').setup({})
		end,
	})
	use('ray-x/lsp_signature.nvim')
	use('nvim-lua/lsp-status.nvim')
	use('neoclide/jsonc.vim')
	use('fhill2/floating.nvim')
	-- use "creepinson/nvim-proj"
	-- use "~/Documents/Code/nvim-proj"
	use('earthly/earthly.vim')
	use('simrat39/rust-tools.nvim')
	use({
		'folke/trouble.nvim',
		config = function()
			require('trouble').setup({})
		end,
	})
	use('kyazdani42/nvim-web-devicons')
	use({ 'LhKipp/nvim-nu', run = ':TSInstall nu' })
	use({ 'dstein64/vim-startuptime' })
	use('IndianBoy42/tree-sitter-just')
	use({ 'edluffy/specs.nvim' })

	use('mfussenegger/nvim-jdtls')
	use('udalov/kotlin-vim')
	use('ggandor/lightspeed.nvim')
	use('jlcrochet/vim-crystal')
	use('stevearc/aerial.nvim')
	use('rcarriga/nvim-notify')
	use('glepnir/dashboard-nvim')
	use('kdheepak/tabline.nvim')
	use('simrat39/inlay-hints.nvim')
end)
