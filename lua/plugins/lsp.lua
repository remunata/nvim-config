return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	config = function()
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim", "Snacks" } },
					workspace = { checkThirdParty = false },
				},
			},
		})

		vim.lsp.config("bashls", {
			root_markers = {},
		})

		vim.lsp.config("astro", {
			before_init = function(_, config)
				local util = require("lspconfig.util")
				local tsdk = util.get_typescript_server_path(config.root_dir)
				if tsdk == "" then
					local npm_root = vim.fn.systemlist("npm root -g")
					if vim.v.shell_error == 0 and npm_root[1] then
						tsdk = npm_root[1] .. "typescript/lib"
					end
				end
				config.init_options = config.init_options or {}
				config.init_options.typescript = config.init_options.typescript or {}
				config.init_options.typescript.tsdk = tsdk
			end,
		})

		-- Diagnostics appearance
		vim.diagnostic.config({ virtual_text = true, severity_sort = true })

		-- Keymaps, set only when an LSP attaches to a buffer.
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(ev)
				local map = function(keys, fn, desc)
					vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = "LSP: " .. desc })
				end

				map("gd", vim.lsp.buf.definition, "Go to definition")
				map("gD", vim.lsp.buf.declaration, "Go to declaration")
				map("[d", function()
					vim.diagnostic.jump({ count = -1 })
				end, "Previous diagnostic")
				map("]d", function()
					vim.diagnostic.jump({ count = 1 })
				end, "Next diagnostic")
			end,
		})
	end,
}
