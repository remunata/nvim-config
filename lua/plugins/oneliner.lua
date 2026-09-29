return {
	{ "tpope/vim-sleuth" },

	{ "nvim-tree/nvim-web-devicons", opts = {} },

	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<leader>s", group = "Search" },
				{ "<leader>F", group = "Format" },
				{ "<leader>n", group = "Navigation" },
				{ "<leader><leader>", group = "Buffer" },
			},
		},
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			presets = {
				bottom_search = true,
				command_palette = true,
			},
		},
	},

	{ "numToStr/Comment.nvim", opts = {} },

	{
		"danymat/neogen",
		config = true,
		version = "*",
		keys = {
			{
				"<leader>ng",
				function()
					require("neogen").generate()
				end,
				desc = "Generate neogen",
			},
		},
	},
}
