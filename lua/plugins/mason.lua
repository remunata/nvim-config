return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"dockerfmt",
				"prettierd",
				"stylua",
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"bashls",
				"fish_lsp",
				"lua_ls",
				"intelephense",
				"html",
				"cssls",
				"jsonls",
				"yamlls",
				"sqlls",
				"dockerls",
			},
		},
	},
}
