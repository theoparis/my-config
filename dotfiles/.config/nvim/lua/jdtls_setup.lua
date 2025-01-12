local M = {}

function M.setup()
	local on_attach = function(client, bufnr)
		require('jdtls.setup').add_commands()
		require('jdtls').setup_dap()

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		local function buf_set_option(...)
			vim.api.nvim_buf_set_option(bufnr, ...)
		end

		buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- Mappings.
		local opts = { noremap = true, silent = true }
		buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	end

	local root_markers = {
		-- Single-module projects
		{
			'build.xml', -- Ant
			'pom.xml', -- Maven
			'settings.gradle', -- Gradle
			'settings.gradle.kts', -- Gradle
			'build.gradle.kts',
		}, -- Multi-module projects
		{ 'build.gradle', 'build.gradle.kts' },
	}

	-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
	local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

	local config = {
		-- The command that starts the language server
		cmd = {
			'java-lsp.sh',
			os.getenv('HOME') .. '/jdtls/workspace/' .. workspace_dir,
		},

		flags = { allow_incremental_sync = true },
		capabilities = {
			workspace = { configuration = true },
			textDocument = {
				completion = { completionItem = { snippetSupport = true } },
			},
		},

		settings = {
			java = {
				signatureHelp = { enabled = true },
				configuration = {
					-- TODO: Setup runtimes automatically
					runtimes = {
						{
							name = 'JavaSE-1.8',
							path = '/usr/lib/jvm/default/',
							sources = '/usr/lib/jvm/default/src.zip',
							javadoc = '/usr/share/doc/default/api',
						},
					},
				},
			},
		},

		on_init = function(client, _)
			client.notify(
				'workspace/didChangeConfiguration',
				{ settings = config.settings }
			)
		end,

		on_attach = on_attach,

		-- This is the default if not provided, you can remove it. Or adjust as needed.
		-- One dedicated LSP server & client will be started per unique root_dir
		root_dir = require('jdtls.setup').find_root(root_markers),
	}

	-- Server
	require('jdtls').start_or_attach(config)
end

return M
