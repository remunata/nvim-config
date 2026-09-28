return {
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		opts = {
			highlight = true,
			separator = " > ",
			depth_limit = 5,
		},
		init = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserNavigationAttach", { clear = true }),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if client and client.server_capabilities.documentSymbolProvider then
						require("nvim-navic").attach(client, ev.buf)
						require("nvim-navbuddy").attach(client, ev.buf)
					end
				end,
			})
		end,
	},
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Navbuddy",
		keys = {
			{ "<leader>nb", "<cmd>Navbuddy<CR>", desc = "Open Navbuddy" },
		},
		opts = {
			lsp = { auto_attach = false },
		},
	},
}
