require('conform').setup({
	formatters_by_ft = {
		lua = { 'stylua' },
		python = { 'isort', 'yapf' },
		javascript = { { 'biome' } },
		json = { { 'biome' } },
		rust = { 'rustfmt' },
		zig = { 'zigfmt' },
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

require('lint').linters_by_ft = {
	javascript = { 'biome' },
	glsl = { 'glslc' },
	kotlin = { 'ktlint' },
}
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
	callback = function()
		require('lint').try_lint()
	end,
})
require('lint').linters.ktlint.args = { '--reporter=json', '--stdin' }
