return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>ff",
			function()
				require("conform").format({ async = true })
			end,
			mode = { "n", "v" },
			desc = "Format file",
		},
	},
	opts = {
		formatters_by_ft = {
			bash = { "shfmt" },
			css = { "prettierd", "prettier", stop_after_first = true },
			dockerfile = { "dockerfmt" },
			dotenv = { "shfmt" },
			html = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			nix = { "nixfmt" },
			php = function(bufnr)
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname:match("/Views/") then
					return {}
				end
				return { "php_cs_fixer" }
			end,
			rust = { "rustfmt" },
			sh = { "shfmt" },
			yaml = { "prettierd", "prettier", stop_after_first = true },
		},

		default_format_opts = {
			lsp_format = "fallback",
		},

		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
	},
}
