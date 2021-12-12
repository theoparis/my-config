local map = vim.api.nvim_set_keymap

map("i", ";;", "<Esc>", {noremap = true})
-- Reload neovim config
map("n", "<leader>sc", ":source ~/.config/nvim/init.lua<CR>", {noremap = true, silent = true})
map("n", "<C-_>", ":call nerdcommenter#Comment('n', 'Toggle')<CR>", {noremap = true})
map("v", "<C-_>", ":call nerdcommenter#Comment('v', 'Toggle')<CR>", {noremap = true})
map("n", "<leader>n", ":NvimTreeToggle<CR>", {noremap = true})
map("n", "<leader>ca", ":Lspsaga code_action<CR>", {noremap = true})
map("n", "<leader>f", "<cmd>lua require'telescope-config'.project_files()<CR>", {noremap = true})
--map("i", "<CR>", [[compe#confirm('<CR>')]], {noremap = true, silent = true, expr = true})
map("n", "<leader>to", ":TodoTelescope<CR>", {noremap = true})
map("n", "<leader>gc", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", {noremap = true})
map("n", "<leader>gr", ":Telescope live_grep<CR>", {noremap = true})
map("n", "<leader>co", ":Codi!!<CR>", {noremap = true})
map("n", "<C-K>", ":Lspsaga hover_doc<CR>", {noremap = true})
map("i", "<C-k>", ":Lspsaga signature_help<CR>", {noremap = true})
map("n", "<leader>gp", ":Lspsaga lsp_finder<CR>", {noremap = true})
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
map("n", "<leader>gh", "copilot#Accept()", {noremap = true, expr = true})
map("i", "<leader>gh", "copilot#Accept()", {noremap = true, expr = true})
-- Code actions with :CodeActionMenu
map("n", "<leader>ca", ":CodeActionMenu<CR>", {noremap = true})
