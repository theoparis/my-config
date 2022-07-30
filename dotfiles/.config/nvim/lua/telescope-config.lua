local M = {}

local telescope = require 'telescope'
telescope.setup {
	defaults = {
		mappings = { n = { ['o'] = require('telescope.actions').select_default } },
		initial_mode = 'normal',
		hidden = true,
		file_ignore_patterns = { '.git/', 'node_modules/', 'target/' },
	},
	extensions = { file_browser = { hidden = true } },
}
telescope.load_extension 'file_browser'
telescope.load_extension 'git_worktree'

M.project_files = function()
	local opts = {
		show_untracked = true,
	}
	local ok = pcall(require('telescope.builtin').git_files, opts)
	if not ok then
		require('telescope.builtin').find_files(opts)
	end
end

return M
