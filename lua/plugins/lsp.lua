return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			-- Diagnostics appearance
			vim.diagnostic.config({
				virtual_text = true,
				severity_sort = true,
				float = { border = "rounded" },
			})

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
					map("<leader>e", vim.diagnostic.open_float, "Show diagnostic")
				end,
			})
		end,
	},
}
