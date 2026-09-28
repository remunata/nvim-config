return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>FF",
				function()
					require("conform").format()
				end,
				mode = { "n", "v" },
				desc = "Format file",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},

			default_format_opts = {
				lsp_format = "fallback",
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}
