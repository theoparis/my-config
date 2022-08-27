version = "0.19.0"

local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"

package.path = package.path .. ";" .. xpm_path .. "/?.lua;" .. xpm_path .. "/?/init.lua"

require("xpm").setup({
	plugins = {
		-- Let xpm manage itself
		"dtomvan/xpm.xplr",
		{
			"dtomvan/extra-icons.xplr",
			after = function()
				xplr.config.general.table.row.cols[2] = { format = "custom.icons_dtomvan_col_1" }
			end,
		},
		"prncss-xyz/icons.xplr",
	},
	auto_install = true,
	auto_cleanup = true,
})

require("icons").setup()
