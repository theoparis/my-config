local map = vim.api.nvim_set_keymap

map("n", "<C-_>", ":call NERDComment(0, 'toggle')<CR>", {noremap = true})
map("v", "<C-_>", ":call NERDComment(0, 'toggle')<CR>", {noremap = true})
map("n", "<leader>n", ":NERDTreeToggle<CR>", {noremap = true})
map("n", "<leader>ca", ":Lspsaga code_action<CR>", {noremap = true})
map("n", "<leader>p", "<cmd>lua require'telescope-config'.project_files()<CR>", {noremap = true})
map("i", "<CR>", [[compe#confirm('<CR>')]], {noremap = true, silent = true, expr = true})
map("n", "<leader>to", ":TodoTelescope<CR>", {noremap = true})
map("n", "<leader>gc", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", {noremap = true})
map("n", "<leader>gr", ":Telescope live_grep<CR>", {noremap = true})
