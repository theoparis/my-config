local map = vim.keymap.set

-- Reload neovim config
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
map('n', '<Leader>w', '<C-w>k')
map('n', '<Leader>a', '<C-w>h')
map('n', '<Leader>s', '<C-w>j')
map('n', '<Leader>d', '<C-w>l')
map('n', '<Leader>j', ':bprevious<CR>', { silent = true })
map('n', '<Leader>k', ':bnext<CR>', { silent = true })
map('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
map('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
map('n', '<Leader>l', ':vsplit term://fish <CR>', { silent = true })
map('t', '<Leader><Esc>', '<C-\\><C-n>', { silent = true })
map('n', '<Leader>y', ':%y<CR>')
map('n', '<leader>sc', ':source ~/.config/nvim/init.lua<CR>')
map('n', '<leader>c', ":call nerdcommenter#Comment('n', 'Toggle')<CR>")
map('v', '<leader>c', ":call nerdcommenter#Comment('v', 'Toggle')<CR>")
map('n', '<leader>n', ':NvimTreeToggle<CR>')
map('n', '<leader>f', ":lua require'telescope-config'.project_files()<CR>")
-- map("i", "<CR>", [[compe#confirm('<CR>')]], {silent = true, noremap = true, silent = true, expr = true})
map('n', '<leader>to', ':TodoTelescope<CR>')
map('n', '<leader>dbg', ":lua require('dapui').toggle()")
map(
  'n',
  '<leader>gc',
  ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>"
)
map('n', '<leader>rg', ':Telescope live_grep<CR>')
map('n', '<leader>K', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>gD', ':lua vim.lsp.buf.implementation()<CR>')
map('n', '<leader>1gD', ':lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>gr', ':Telescope lsp_references<CR>')
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>g[', ':lua vim.diagnostic.goto_prev()<CR>')
map('n', '<leader>g]', ':lua vim.diagnostic.goto_next()<CR>')
map('n', '<leader>r', ':lua LspRename()')
map('n', '<leader>wx', ':TroubleToggle<CR>')
map('n', '<leader>ww', ':TroubleToggle workspace_diagnostics<CR>')
map('n', '<leader>wq', ':TroubleToggle quickfix<CR>')
map('n', '<leader>wl', ':TroubleToggle loclist<CR>')
-- Code actions with :CodeActionMenu
map('n', '<leader>a', ':CodeActionMenu')
