return {
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"astro",
				"bashls",
				"cssls",
				"dockerls",
				"fish_lsp",
				"gopls",
				"html",
				"intelephense",
				"jsonls",
				"lua_ls",
				"nil_ls",
				"rust_analyzer",
				"sqlls",
				"yamlls",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"dockerfmt",
				"nixfmt",
				"prettierd",
				"shfmt",
				"stylua",
			},
		},
	},
}
