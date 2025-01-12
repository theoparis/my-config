local cmp = require('cmp')

cmp.setup({
	-- Enable LSP snippets
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		-- Add tab support
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
	-- installed sources
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'luasnip' },
		{ name = 'orgmode' },
	},
})

vim.cmd.autocmd('CursorHold <buffer> lua vim.diagnostic.open_float()')
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = { border = 'rounded', focusable = false },
})
