local map = vim.keymap.set

map('n', '<leader>w', '<C-w>k')
map('n', '<leader>a', '<C-w>h')
map('n', '<leader>s', '<C-w>j')
map('n', '<leader>d', '<C-w>l')
--map('n', '<leader>j', ':bprevious<CR>', { silent = true })
--map('n', '<leader>k', ':bnext<CR>', { silent = true })
--map('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
--map('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
--map('n', '<Leader>l', ':vsplit term://zsh<CR>', { silent = true })
--map('t', '<leader><Esc>', '<C-\\><C-n>', { silent = true })
--map('n', '<leader>y', ':%y<CR>')
--map('n', '<leader>o', ':tabnew<CR>')
map('n', '<leader>dbg', require('dapui').toggle)
map(
	'n',
	'<leader>fw',
	require('telescope').extensions.git_worktree.git_worktrees
)
map('n', '<leader>f', require('telescope.builtin').find_files)
map('n', '<leader>fb', require('telescope.builtin').buffers)
map('n', '<leader>ff', ':Neotree<CR>')
map('n', '<leader>fr', require('telescope.builtin').oldfiles)
map('n', '<leader>fs', require('telescope.builtin').grep_string)
map('n', '<leader>fg', require('telescope.builtin').live_grep)
map('n', '<leader>fd', require('telescope.builtin').diagnostics)
map('n', '<leader>t', ':TroubleToggle<CR>')
map('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
map(
	'n',
	'gr',
	require('telescope.builtin').lsp_references,
	{ desc = '[G]oto [R]eferences' }
)
map('n', 'gI', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })
map(
	'n',
	'<leader>D',
	vim.lsp.buf.type_definition,
	{ desc = 'Type [D]efinition' }
)
map(
	'n',
	'<leader>ds',
	require('telescope.builtin').lsp_document_symbols,
	{ desc = '[D]ocument [S]ymbols' }
)
map(
	'n',
	'<leader>ws',
	require('telescope.builtin').lsp_dynamic_workspace_symbols,
	{ desc = '[W]orkspace [S]ymbols' }
)
map('n', '<leader>K', vim.lsp.buf.hover)
map('n', '<leader>gD', vim.lsp.buf.implementation)
map('n', '<leader>1gD', vim.lsp.buf.type_definition)
map('n', '<leader>gd', vim.lsp.buf.definition)
map('n', '<leader>rn', LspRename)
map('n', '<leader>ca', vim.lsp.buf.code_action)

map('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
map(
	'n',
	'<C-k>',
	vim.lsp.buf.signature_help,
	{ desc = 'Signature Documentation' }
)
map('n', '<leader>/', function()
	require('telescope.builtin').current_buffer_fuzzy_find(
		require('telescope.themes').get_dropdown({
			winblend = 10,
			previewer = false,
		})
	)
end, { desc = '[/] Fuzzily search in current buffer]' })
