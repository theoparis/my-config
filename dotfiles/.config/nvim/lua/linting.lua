require('conform').setup({
	formatters_by_ft = {
		lua = { 'stylua' },
		python = { 'isort', 'black' },
		javascript = { { 'prettierd', 'prettier' } },
		rust = { 'rustfmt' },
		zig = { 'zigfmt' },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

require('lint').linters_by_ft = {
	javascript = { 'eslint_d' },
	glsl = { 'glslc' },
}
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
	callback = function()
		require('lint').try_lint()
	end,
})
