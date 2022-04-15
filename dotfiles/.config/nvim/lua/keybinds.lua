local map = vim.api.nvim_set_keymap

-- Reload neovim config
map("n", "<leader>sc", ":source ~/.config/nvim/init.lua<CR>", { silent = true, noremap = true, silent = true })
map("n", "<C-_>", ":call nerdcommenter#Comment('n', 'Toggle')<CR>", { silent = true, noremap = true })
map("v", "<C-_>", ":call nerdcommenter#Comment('v', 'Toggle')<CR>", { silent = true, noremap = true })
map("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
map("n", "<leader>f", ":lua require'telescope-config'.project_files()<CR>", { silent = true, noremap = true })
-- map("i", "<CR>", [[compe#confirm('<CR>')]], {silent = true, noremap = true, silent = true, expr = true})
map("n", "<leader>to", ":TodoTelescope<CR>", { silent = true, noremap = true })
map("n", "<leader>dbg", ":lua require('dapui').toggle()", { silent = true, noremap = true })
map(
	"n",
	"<leader>gc",
	":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
	{ silent = true, noremap = true }
)
map("n", "<leader>rg", ":Telescope live_grep<CR>", { silent = true, noremap = true })
map("n", "<leader>co", ":Codi!!<CR>", { silent = true, noremap = true })
map("n", "<leader>K", ":lua vim.lsp.buf.hover()<CR>", { silent = true, noremap = true })
map("n", "<leader>gD", ":lua vim.lsp.buf.implementation()<CR>", { silent = true, noremap = true })
map("n", "<leader>1gD", ":lua vim.lsp.buf.type_definition()<CR>", { silent = true, noremap = true })
map("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", { silent = true, noremap = true })
map("n", "<leader>gr", ":lua vim.lsp.buf.references()<CR>", { silent = true, noremap = true })
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { silent = true, noremap = true })
map("n", "<leader>g[", ":lua vim.diagnostic.goto_prev()<CR>", { silent = true, noremap = true })
map("n", "<leader>g]", ":lua vim.diagnostic.goto_next()<CR>", { silent = true, noremap = true })
map("n", "<leader>ar", ':lua require("renamer").rename()<CR>', { silent = true, noremap = true })
map("n", "<leader>gh", "copilot#Accept()", { silent = true, noremap = true, expr = true })
map("i", "<leader>gh", "copilot#Accept()", { silent = true, noremap = true, expr = true })
map("n", "<leader>xx", ":TroubleToggle<CR>", { silent = true, noremap = true })
map("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>", { silent = true, noremap = true })
map("n", "<leader>xq", ":TroubleToggle quickfix<CR>", { silent = true, noremap = true })
map("n", "<leader>xl", ":TroubleToggle loclist<CR>", { silent = true, noremap = true })
-- Code actions with :CodeActionMenu
